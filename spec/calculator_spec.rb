require 'spec_helper'
require './calculator_class'

describe  Calculator do

	describe "with valid input" do

		before(:each) { @calculator = Calculator.new([1,2,3,-4]) }

		subject { @calculator }

		it { should respond_to(:numbers) }

		it "should add the numbers" do
			@calculator.plus.should eq 2
		end

		it "should subtract the numbers" do
			@calculator.minus.should eq 0
		end
		
		it "should clear array" do
			@calculator.clear
			@calculator.numbers.should eq []
		end

		it "should not respond to nonexistent method" do
			expect do 
				@calculator.non_existent_method
			end.to raise_error(NameError)
		end

	end

	describe "with invalid input invoking 'plus' and 'minus' methods" do

		it "should raise error" do
			@calculator = Calculator.new([1,"a",3,-4])
			expect do
			  @calculator.plus
			end.to raise_error(TypeError)
			expect do
			  @calculator.minus
			end.to raise_error(TypeError)
		end

	end

end
