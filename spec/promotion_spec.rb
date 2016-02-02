require 'spec_helper'

describe Promotion do

  before :each do
    @promotion = Promotion.new({type: "item", product_id: 'SR1', discount_total: 4.50, cart_total: 3})
  end

  context "#new" do
    it 'returns a Promotion object' do
      expect(@promotion).to be_an_instance_of Promotion
    end

    it 'returns a type' do
      expect(@promotion.type).to eql("item")
    end

    it 'returns a product id' do
      expect(@promotion.product_id).to eql('SR1')
    end

    it 'returns a discount total' do
      expect(@promotion.discount_total).to eql(4.50)
    end

    it 'returns a cart total' do
      expect(@promotion.cart_total).to eql(3)
    end
  end

end