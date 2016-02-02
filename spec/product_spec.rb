require 'spec_helper'

describe Product do

  before :each do
    @product = Product.new('FR1', 'Fruit tea', 3.11)
  end

  context "#new" do
    it 'returns a Product object' do
      expect(@product).to be_an_instance_of Product
    end

    it 'returns a product code' do
      expect(@product.product_code).to eql('FR1')
    end

    it 'returns a name' do
      expect(@product.name).to eql('Fruit tea')
    end

    it 'returns a price' do
      expect(@product.price).to eql(3.11)
    end
  end

end