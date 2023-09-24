require "http/server"
#require "json"
require "sqlite3"
require "./µPub/config.cr"
require "./µPub/Controllers/*"
require "./µPub/Models/*"
require "./µPub/Views/*"

# TODO: Write documentation for `µPub`
module Main
  VERSION = "0.1.0"
  DOMAIN  = "0.0.0.0"
  PORT    = 4000

  # TODO: Put your code here
server = HTTP::Server.new([HTTP::LogHandler.new, Routes.new])
server.bind_tcp DOMAIN, PORT
server.listen
end
