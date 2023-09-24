# Standard library
#
# @author Archipelag Team
class StdLib
  # Return text value.
  #
  # @return [String] value
  # @author Luunube
  # @author Archipelag Team
  # @since 0.10.0
  def self.txt(value)
    $html += value
  end

  # Converts the img key from the Yaml file to the corresponding HTML tag.
  #
  # @return [String] HTML img tag
  # @author Luunube
  # @author Archipelag Team
  # @since 0.10.0
  def self.img(value)
    img = '<img src="'
    img += value
    img += '" loading="lazy">'
    img += "\n"
    img
  end

  def self.slug(url)
    File.new("#{url}.html", 'w').puts($html)
  end

  def description; end

  def self.css(file)
    css = 'link href="'
    css += file
    css += '.css" rel="stylesheet" type="text/css"'
    css += "\n"
    css
  end

  def self.js(file)
    js = 'script async=true src="'
    js += file
    js += '.js"'
    js += "\n"
    js
  end
end
