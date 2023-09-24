require "yaml"
require "./txt2webgame/*"

# TODO: Write documentation for `Txt2webgame`
module Txt2webgame
  VERSION = "0.1.0"

  files = Dir["./files/templates/*.yaml"]
  files.each do |path|
    yaml = YAML.parse(File.read(path))
    #filename_output = path[18..-6]
    template = yaml.as_h
    template.each_key do |key|
      if Dir["./files/definitions/#{key}.cr"]
        method = key.as_s
        #File.write("./file.cr", "puts #{'"'}#{method}#{'"'}")
        {{ run("./file.cr") }}
      end
    end
  end
end
