require "./lib/calculator"

RSpec.describe Calculator do

  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#subtract" do
    it "returns the subtraction of two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(10, 5)).to eql(5)
    end
    it "returns the subtraction of more than two number" do
      calculator = Calculator.new
      expect(calculator.subtract(20, 5, 5)).to eql(10)
    end
  end

  describe "#multiply" do
    it "returns the multiplication of two number" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5)).to eql(10)
    end
    it "returns the multiplication of multiple numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(3, 5, 9)).to eql(135)
    end
  end
end