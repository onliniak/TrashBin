require "socket"
require "http/server"

server = HTTP::Server.new do |context|

  sock = UNIXSocket.new("/tmp/myapp.sock")
  sock.puts "message"
  response = sock.gets

  context.response.content_type = "text/plain"
  context.response.print response
end

address = server.bind_tcp 8080
puts "Listening on http://#{address}"
server.listen