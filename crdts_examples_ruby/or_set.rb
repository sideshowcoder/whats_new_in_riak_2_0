require_relative "./init.rb"

set = Meangirls::ORSet.new

set << 1
set << 2
set << 3
set << 4

set.delete 2

set << 1

puts "Elements:\n\n#{set.to_a}\n\n"

puts "Structure:\n\n#{set.to_json}"
