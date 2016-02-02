class Promotion

  attr_accessor :type, :product_id, :cart_total, :discount_total

  def initialize(discount={})
    @type = discount[:type]
    @product_id = discount[:product_id] || false
    @cart_total = discount[:cart_total]
    @discount_total = discount[:discount_total]
  end

end