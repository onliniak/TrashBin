require "webauthn"
require "kemal"

# TODO: Write documentation for `Webtest`
module Webtest
  VERSION = "0.1.0"

  # TODO: Put your code here
  #Webauthn::A.new

  get "/" do
    "Hello World!"
  end

  Kemal.config.host_binding = "localhost"
  Kemal.run

end
