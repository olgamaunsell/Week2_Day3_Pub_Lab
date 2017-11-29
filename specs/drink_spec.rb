require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

# A Drink should have a name,
# a price and alcohol level
  def setup
    @drink = Drink.new("Tennants", 5, 50)
  end

  def test_drink_has_name
    assert_equal("Tennants", @drink.name)
  end

  def test_drink_has_price
    assert_equal(5, @drink.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(50, @drink.alcohol_level)
  end
end




# # A Customer should have a name, and a wallet
# #A Pub should have a name, a till, and a collection of drinks
# A Customer should be able to buy a Drink from the Pub,
# reducing the money in its wallet and
# increasing the money in the Pub's till
