require_relative 'promotion'

class Checkout

  attr_accessor :total_promotion, :promotion

  def initialize(promotion)
    @basket = []
    @promotion = promotion
    @total_promotion = 0
  end

  def scan(product)
    @basket << product
  end

  def basket
    @basket
  end

  def total_price
    basket.map(&:price).inject(0, &:+)
  end

  def run_promotion
    promotion.each do |p|
      calculate_item_promotion(p) if p.type == "item"
      calculate_buy_one_get_one_free(p) if p.type == "buy one get one free"
    end
  end


  def calculate_item_promotion(promotion)
    products = basket.find_all {|p| p.product_code == promotion.product_id }
    if products && products.count >= promotion.cart_total
      products.each{|p| p.price = promotion.discount_total} if products.count >= promotion.cart_total
      self.total_promotion += total_price if products.count >= promotion.cart_total
    end
  end

  def calculate_buy_one_get_one_free(promotion)
    products = basket.find_all {|p| p.product_code == promotion.product_id }
    if products && products.count >= promotion.cart_total
      products.first.price = promotion.discount_total
      self.total_promotion += total_price
    end
  end

  def total
    total_promotion.round(2)
  end

end