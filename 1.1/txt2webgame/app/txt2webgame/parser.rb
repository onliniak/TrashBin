##
# Klasa +Parser+ jest odpowiedzialna za przetwarzanie plikow.
#
class Parser
  def initialize
    @templates   = {}
    @definitions = {}

    prepare_templates
    prepare_methods
    delegate
  end

  def delegate
    @definitions.each do |klasa, method|
      @templates.each_key do |variable|
        size = @templates[variable].keys.length
        size.times do |number|
          order = @templates[variable].keys[number]
          Helpers.call_method(klasa).send(order, @templates[variable][order]) if method.include? order.to_sym
        end
      end
    end
  end

  def method_list(ruby_file)
    name = ruby_file[0..-4]
    methods = Helpers.call_method(name).public_methods(false)
    @definitions[name] = methods
  end

  def prepare_templates
    require 'psych'
    Dir["#{File.dirname(__FILE__)}/../../lib/templates/*.yaml"].each do |path|
      yaml = Psych.load_file(path)
      filename = path[61..-6].to_sym
      @templates[filename] = {}
      @templates[filename].merge!(yaml)
      @templates.merge(yaml)
    end
  end

  def prepare_methods
    Dir["#{File.dirname(__FILE__)}/../../lib/*.rb"].each do |ruby_file|
      require_relative ruby_file
      method_list(ruby_file[51..-1])
    end
  end
end
