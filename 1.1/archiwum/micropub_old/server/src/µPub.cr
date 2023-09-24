require "http/server"
require "json"

server = HTTP::Server.new([
  HTTP::LogHandler.new,
]) do |context|
    req = context.request
    res = context.response
        if req.method == "GET" && req.path == "/foo"
            query = req.query_params["test"]? || "" #=> http://0.0.0.0:8080/foo?test=test
            res.headers["Server"] = "Crystal"
            res.cookies["foo"] = HTTP::Cookie.new("foo", "bar", "/foo", Time.utc + 12.hours, secure: true)
            res.content_type = "text/plain"
            res.print "Hello world! #{query}" #=> Hello world! test
        elsif req.method == "GET" && req.path == "/json"
            res.content_type = "application/json"
            res.print "Hello World!".to_json
        elsif req.method == "POST" && req.path == "/john"
            body = context.request.body.not_nil!.gets_to_end # Solved by: Kemal/param_parser
            params = HTTP::Params.parse(body) #=> curl -X POST http://0.0.0.0:8080/john  -d 'surname=Smith' 
            surname = params["surname"]
            res.content_type = "text/plain"
            res.print "#{surname}" #=> Greeting, John! Smith
        else
            res.status_code = 500
        end
    end

address = server.bind_tcp "0.0.0.0", 8080
puts "Listening on http://#{address}"
server.listen