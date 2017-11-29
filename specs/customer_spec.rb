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

    #The method add_money acts on the pub to add
    #the value of the drink to the till
    till_expected = 1006
    actual_till = pub.add_money(drink.price)
    assert_equal(till_expected, actual_till)

  end

  def test_customer_can_afford_drink_true
    drink = Drink.new("Gin", 6)
    customer = Customer.new("Olga", 100)

    expected = true
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_drink_false
    drink = Drink.new("Gin", 6)
    customer = Customer.new("Olga", 4)

    expected = false
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)

  end
end
