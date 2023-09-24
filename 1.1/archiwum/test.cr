

require "benchmark"

 

title = "Title of the document"

body  = "The content of the document......"


  str3 = IO::Memory.new

    str3 << "<!DOCTYPE html>"

    str3 << "<html>"

    str3 << "<head>"

    str3 << "<title>"

  	str3 << title

  	str3 << "</title>"

    str3 << "</head>"

    str3 << "<body>"

    str3 << body

    str3 << "</body>"

    str3 << "</html>"


Benchmark.ips(warmup: 5, calculation: 120) do |x|
  x.report("memory IO") { str3 }
end
