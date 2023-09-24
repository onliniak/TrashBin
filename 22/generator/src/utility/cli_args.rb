# frozen_string_literal: true

#
# <Description>
#
class Utility
  def cli_arguments
    ARGV.each do |a|
      puts "Argument: #{a}"
    end
  end
end
