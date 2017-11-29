require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def test_drink_has_name
    drink = Drink.new("Tennants", 5)
    assert_equal("Tennants", drink.name)
  end

  def test_drink_has_price
    drink = Drink.new("Tennants", 5)
    assert_equal(5, drink.price)
  end

end



# # A Drink should have a name, and a price
# # A Customer should have a name, and a wallet
# #A Pub should have a name, a till, and a collection of drinks
C# A Customer should be able to buy a Drink from the Pub,
# reducing the money in its wallet and
# increasing the money in the Pub's till
