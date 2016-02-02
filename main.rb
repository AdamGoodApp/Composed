require 'pry'
require_relative 'product'
require_relative 'checkout'
require_relative 'promotion'

item1 = Product.new('FR1', 'Fruit tea', 3.11)
item2 = Product.new('FR1', 'Fruit tea', 3.11)
item3 = Product.new('FR1', 'Fruit tea', 3.11)
item4 = Product.new('SR1', 'Strawberries', 5.00)
item5 = Product.new('SR1', 'Strawberries', 5.00)
item6 = Product.new('SR1', 'Strawberries', 5.00)
item7 = Product.new('CF1', 'Coffee', 11.23)

promotion1 = Promotion.new({type: "item", product_id: 'SR1', discount_total: 4.50, cart_total: 3})
promotion2 = Promotion.new({type: "buy one get one free", product_id: 'FR1', discount_total: 0, cart_total: 2})

co = Checkout.new([promotion1, promotion2])

co.scan(item1)
co.scan(item4)
co.scan(item5)
co.scan(item6)



co.run_promotion
price = co.total

p "Total price: £#{price}"



