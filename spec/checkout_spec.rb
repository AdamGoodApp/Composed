require 'spec_helper'

describe Checkout do

  before :each do
    @item1 = Product.new('FR1', 'Fruit tea', 3.11)
    @item2 = Product.new('FR1', 'Fruit tea', 3.11)
    @item3 = Product.new('FR1', 'Fruit tea', 3.11)
    @item4 = Product.new('SR1', 'Strawberries', 5.00)
    @item5 = Product.new('SR1', 'Strawberries', 5.00)
    @item6 = Product.new('SR1', 'Strawberries', 5.00)
    @item7 = Product.new('CF1', 'Coffee', 11.23)

    promotion1 = Promotion.new({type: "item", product_id: 'SR1', discount_total: 4.50, cart_total: 3})
    promotion2 = Promotion.new({type: "buy one get one free", product_id: 'FR1', discount_total: 0, cart_total: 2})

    @checkout = Checkout.new([promotion1, promotion2])
  end

  context "#new" do
    it 'returns a Checkout object' do
      expect(@checkout).to be_an_instance_of Checkout
    end

    it 'returns a promotion' do
      expect(@checkout.promotion).to include(Promotion)
    end
  end

  context "#total" do
    it 'exists as a method' do
      expect(@checkout).to respond_to(:total)
    end

    #Basket items: FR1,SR1,FR1,FR1,CF1
    it "prices example basket 1 correctly" do
      @checkout.scan(@item1)
      @checkout.scan(@item4)
      @checkout.scan(@item2)
      @checkout.scan(@item3)
      @checkout.scan(@item7)
      @checkout.run_promotion
      expect(@checkout.total).to eql(22.45)
    end

    #Basket items: FR1,FR1
    it "prices example basket 2 correctly" do
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      @checkout.run_promotion
      expect(@checkout.total).to eql(3.11)
    end

    #Basket items: SR1,SR1,FR1,SR1
    it "prices example basket 3@ correctly" do
      @checkout.scan(@item4)
      @checkout.scan(@item5)
      @checkout.scan(@item1)
      @checkout.scan(@item6)
      @checkout.run_promotion
      expect(@checkout.total).to eql(16.61)
    end

  end

end