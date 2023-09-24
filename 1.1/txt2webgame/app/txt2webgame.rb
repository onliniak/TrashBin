require 'sequel'

require_relative './txt2webgame/helpers'
# require_relative './txt2webgame/output'
require_relative './txt2webgame/parser'

(foo ||= []) << "bar"
hash = []
(hash ||= []) << "bar"
hash << 'foo'
hash << 'fgdd'

p hash.join(' ')
p foo

# Parser.new
