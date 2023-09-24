before_get "/" do |env|
  env.response.headers.add("Link", "<#{DOMAIN}/auth>; rel='authorization_endpoint'")
  env.response.headers.add("Link", "<#{DOMAIN}/token>; rel='token_endpoint'")
  env.response.headers.add("Link", "<#{DOMAIN}/micropub>; rel='micropub_endpoint'")
end

get "/" do
 <<-HTML
        <html>
            <head>
            <link rel="authorization_endpoint" href="#{DOMAIN}/auth">
            <link rel="token_endpoint" href="#{DOMAIN}/token">
            <link rel="micropub" href="#{DOMAIN}/micropub">
            </head>
        </html>
    HTML
end
