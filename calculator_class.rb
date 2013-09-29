class Calculator
	attr_reader :numbers

	def initialize(numbers)
		@numbers = numbers
	end

	def plus
		@numbers.inject(0,:+)
	end

	def minus
		first = @numbers.shift
		@numbers.inject(first,:-)
	end

	def clear
		@numbers = []
	end
end
