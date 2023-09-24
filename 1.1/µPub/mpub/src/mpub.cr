require "indieauth"
require "micropub"
require "sqlite3"
require "toro"
require "./µPub/*"

# TODO: Write documentation for `Mpub`
module MpubOnliniak
  VERSION = "0.1.0"

App.run PORT do |server|
  server.bind_tcp(DOMAIN, PORT, true)
  server.listen
  end
end
