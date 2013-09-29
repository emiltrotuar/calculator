require './calculator_class'

puts "Enter numbers divided by spaces"

accepted = false

until accepted
	do_break = false
	numbers = gets.split.each do |i|
  	unless i[/^-?\d+$/]
	  	puts "Please enter a valid input"
	  	do_break = true
  	end
  end.map(&:to_i)
  next if do_break
  if numbers.count < 2
  	puts "Please enter 2 or more numbers"
  	next
  end
  accepted = true
end

cl = Calculator.new(numbers)

puts "Result of adding: #{cl.plus}"

puts "Result of subtraction: #{cl.minus}"

cl.clear
