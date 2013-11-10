class Calculator
	attr_reader :numbers

	def initialize input = $stdin, output = $stdout
		@output = output
		@output.puts "Enter numbers divided by spaces"

		accepted = false
		until accepted
			do_break = false
			numbers = input.gets.chop.split.each do |i|
				unless i[/^-?\d+$/]
					@output.puts "Please enter a valid input"
					do_break = true
				end
			end.map(&:to_i)
			next if do_break
			if numbers.count < 2
				@output.puts "Please enter 2 or more numbers"
				next
			end
			accepted = true
		end
		@numbers = numbers
	end

	def plus
		res = @numbers.inject(0,:+)
		@output.puts "Result of adding: #{res}"
	end

	def minus
		first = @numbers.shift
		res = @numbers.inject(first,:-)
		@output.puts "Result of subtraction: #{res}"
	end

	def clear
		@numbers = []
	end
end