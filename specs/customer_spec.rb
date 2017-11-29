require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../pub")

class TestCustomer < MiniTest::Test

  def test_customer_has_name
    customer = Customer.new("Olga", 30)
    assert_equal("Olga", customer.name)
  end

  def test_customer_has_money
    customer = Customer.new("Olga", 30)
    assert_equal(30, customer.wallet)
  end

  def test_customer_can_buy_drink
    drink = Drink.new("Gin", 6)
    pub = Pub.new("Chanter", 1000, [drink])
    customer = Customer.new("Olga", 100)

    customer.buy_drink(pub, drink)
    expected = 94
    actual = customer.wallet
    assert_equal(expected, actual)

  end


end
