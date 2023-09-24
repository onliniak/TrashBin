require "http/server"

r = Random.new.rand(1..100)

stdout = IO::Memory.new
process = Process.new("deno", ["run", "fb.js", r.to_s], output: stdout)
status = process.wait
output = stdout.to_s

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print output
end

address = server.bind_tcp 8080
puts "Listening on http://#{address}"
server.listen