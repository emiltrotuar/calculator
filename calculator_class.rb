class Calculator
	attr_reader :numbers

	def initialize(numbers)
		@numbers = numbers
	end

	def plus
		@numbers.inject(0) do |sum,i|
			sum+=i
		end
	end

	def minus
		first = @numbers.shift
		@numbers.inject(first) do |sum,i|
			sum-=i
		end
	end

	def clear
		@numbers = []
	end
end
