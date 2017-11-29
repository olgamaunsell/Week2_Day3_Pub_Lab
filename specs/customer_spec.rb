require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def test_customer_has_name
    customer = Customer.new("Olga", 30)
    assert_equal("Olga", customer.name)
  end

  # def test_drink_has_price
  #   drink = Drink.new("Tennants", 5)
  #   assert_equal(5, drink.price)
  # end
  
end
