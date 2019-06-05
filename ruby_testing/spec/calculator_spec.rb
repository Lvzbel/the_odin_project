require "./lib/calculator"

RSpec.describe Calculator do
  describe "#add" do
    it "return the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#subtract" do
    it "return the subtraction of two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(10, 5)).to eql(5)
    end
    it "return the subtraction of more than two number" do
      calculator = Calculator.new
      expect(calculator.subtract(20, 5, 5)).to eql(10)
    end
  end
end