require 'spec_helper'
require './calculator_class'

describe  Calculator do

	let(:input)  {double('input').as_null_object}
	let(:output) {double('output').as_null_object}

	describe "with valid input" do

		let :calculator do
			input.stub(:gets).and_return "1 2 3 -4\n"  
			Calculator.new input, output 
		end

		it "should initialize calculator" do
			output.should_receive(:puts).with "Enter numbers divided by spaces" 
			calculator.numbers.should eq [1,2,3,-4]
		end

		it "should add the numbers" do
			output.should_receive(:puts).with "Result of adding: 2"
			calculator.plus
		end

		it "should subtract the numbers" do
			output.should_receive(:puts).with "Result of subtraction: 0"
			calculator.minus
		end
		
		it "should clear array" do
			calculator.clear
			calculator.numbers.should eq []
		end
	end

	describe "with invalid input" do

		it "should ask for new input if got not a number" do
			output.should_receive(:puts).with "Please enter a valid input" 
			input.stub(:gets).and_return "1 a 3 w\n", "1 2 3 4\n"  
			Calculator.new input, output
		end

		it "should take not less than 2 numbers" do
			output.should_receive(:puts).with("Please enter 2 or more numbers").twice
			input.stub(:gets).and_return "\n", "1\n", "1 2\n"  
			Calculator.new input, output
		end
	end
end
