require_relative "./init.rb"

counter = Meangirls::GCounter.new

Meangirls.node = "foo"
counter + 1
counter + 2

Meangirls.node = "bar"
counter + 1
counter + 2

Meangirls.node = "baz"
counter + 1

puts "Value:\n\n#{counter.to_f} \n\n"

puts "Structure:\n\n#{counter.to_json}"




