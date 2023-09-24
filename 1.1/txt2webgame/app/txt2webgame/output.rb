require 'liquid'

##
# Ta klasa odpowiada za zwracanie przetworzonego tekstu do przegladarki.
#
class Output
  def initialize
    @output_header  = ''
    @output_footer  = ''
    @output_html    = ''
    # html
  end

  def write2html(txt)
    @output_html = txt
  end

  def read_from_html
    @output_html
  end

  def html
    puts Liquid::Template.parse(
      File.read('lib/templates/template.liquid').delete!("\n")
    ).render!('header' => @output_header,
              'body' => @output_html,
              'footer' => @output_footer)
  end
end
