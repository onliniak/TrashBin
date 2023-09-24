##
# Klasa pomocnicza
#
class Helpers
  def self.call_method(txt)
    Object.const_get(to_camel_case(txt))
  end

  def self.to_camel_case(txt)
    txt.split('_').collect(&:capitalize).join
  end
end
