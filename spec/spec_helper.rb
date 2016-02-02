require_relative '../checkout'
require_relative '../promotion'
require_relative '../product'
require 'pry'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.tty = true
  config.color = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end