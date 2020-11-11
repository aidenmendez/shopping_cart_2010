require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/market'
require './lib/vendor'
require './lib/item'

class MarketTest < Minitest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
  end

  def test_it_exists
    assert_instance_of Market, @market
  end
end