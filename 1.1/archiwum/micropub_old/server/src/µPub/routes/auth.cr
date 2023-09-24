require "myhtml"    #HTML parser

#TODO: https://play.crystal-lang.org/#/r/9kpx

class Auth

auth_code = Random::Secure.rand(UInt64)

def initialize(name : String)
    @@name = name
end

def self.request(client : String | Nil, redirect : String | Nil, permissions : String | Nil)
    @@client    = client
    @@redirect  = redirect
    @@scope     = permissions
end

before_get "/auth" do |env|

    who = env.params.query["client_id"]? || "https://example.com"

DB.open("sqlite3://./data.db") do |db|
known = db.query_one? "SELECT client_id FROM Auth WHERE client_id = ?", who, &.read(String)
if known === who
    env.redirect "/login"
    else
        # Load ONLY when client is not found in database.
    me = env.params.query["me"]
    permissions = env.params.query["scope"]?
    redirect = env.params.query["redirect_uri"]
    rtype = env.params.query["response_type"]? || "id"
    state = env.params.query["state"]

    Auth.request(who, redirect, permissions)

    response = HTTP::Client.get who
    html = Myhtml::Parser.new(response.body)

    logo = html.css(".h-x-app img.u-logo").map(&.attribute_by("src")).to_a[0]? ||
            html.css(".h-app img.u-logo").map(&.attribute_by("src")).to_a[0]? ||
            "logo"
    html.free

    html2 = Myhtml::Parser.new(response.body)
    title = html2.css(".h-x-app .p-name").map(&.inner_text).to_a[0]? ||
            html2.css(".h-app .p-name").map(&.inner_text).to_a[0]? ||
            "title"
    html2.free

    Auth.new( <<-HTML
        <html>
            <div style="padding: 5% 30% 5% 15%">
                <div>
                <div style="width: 72px;height: 72px;border: double">
                <img src="#{logo}">
                </div>

                Allow <a href="#{who}">#{title}</a> access to #{me}?

                <a href="#{redirect}?code=#{auth_code}&state=#{state}">YES</a>
                <br />
                <a href="#{who}">NO</a>
                </div>

            <div style="float: right">
            #{permissions}
            </div>
            </div>
        </html>
    HTML
    )

end
end
end

get "/auth" do
pp @@name
end

#TODO: Check types.

post "/auth" do |env|
grant_type = env.params.body["grant_type"]?
code = env.params.body["code"]
client_id = env.params.body["client_id"]
redirect_uri = env.params.body["redirect_uri"]

if code.to_s == auth_code.to_s && client_id.to_s == @@client.to_s && redirect_uri.to_s == @@redirect.to_s
    env.response.content_type = "application/json"
    {"me": DOMAIN}.to_json
else
    env.response.status_code = 401
    pp "invalid_request"
end

end

post "/token" do |env|
grant_type = env.params.body["grant_type"]?
code = env.params.body["code"]
client_id = env.params.body["client_id"]
redirect_uri = env.params.body["redirect_uri"]
me = env.params.body["me"]

puts grant_type
puts code
puts auth_code
puts client_id
puts @@client 
puts redirect_uri
puts @@redirect 
puts me
puts "#{DOMAIN}/"

if grant_type == "authorization_code" && code.to_s == auth_code.to_s && client_id.to_s == @@client.to_s && redirect_uri.to_s == @@redirect.to_s && me.to_s == "#{DOMAIN}/".to_s || me.to_s == DOMAIN.to_s
    env.response.content_type = "application/json"
    {"access_token": auth_code,
     "token_type": "Bearer",
    "scope": @@scope,
    "me": DOMAIN}.to_json

else
    env.response.status_code = 401
    pp "invalid_request"
end

end

end
