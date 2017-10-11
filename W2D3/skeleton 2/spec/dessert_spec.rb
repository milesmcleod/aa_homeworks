require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Armando') }
  subject(:flan) { Dessert.new('flan', 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(flan.type).to eq('flan')
    end

    it "sets a quantity" do
      expect(flan.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(flan.ingredients).to be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('flan', 'lots', 'armando')}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      flan.add_ingredient('beans')
      expect(flan.ingredients).to include('beans')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(flan.ingredients).to receive(:shuffle!)
      flan.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      flan.eat(5)
      expect(flan.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { flan.eat(10000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Armando Armando")
      expect(flan.serve).to eq('Armando Armando has made 50 flans!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(flan)
      flan.make_more
    end
  end
end
