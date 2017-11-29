require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../pub")

class TestCustomer < MiniTest::Test

  def test_customer_has_name
    customer = Customer.new("Olga", 30, 21)
    assert_equal("Olga", customer.name)
  end

  def test_customer_has_money
    customer = Customer.new("Olga", 30, 21)
    assert_equal(30, customer.wallet)
  end

  def test_customer_drunkenness__is_zero
    customer = Customer.new("Olga", 30, 21)
    assert_equal(0, customer.drunkenness)
  end

  def test_customer_can_buy_drink__age_over_18
    drink1 = Drink.new("Gin", 6, 100)
    drink2 = Drink.new("Vodka", 7, 150)
    pub = Pub.new("Chanter", 1000, [drink1, drink2], 500)
    customer = Customer.new("Olga", 100, 21)
    #customer buys 1st drink
    customer.buy_drink(pub, drink1)
    expected = 94
    actual = customer.wallet
    assert_equal(expected, actual)
    assert_equal(1006,pub.till)
    #also check customer drunkeness level increases
    assert_equal(100, customer.drunkenness)
    #customer buys 2nd drink
    customer.buy_drink(pub, drink2)
    expected = 87
    actual = customer.wallet
    assert_equal(expected, actual)
    assert_equal(1013,pub.till)
    assert_equal(250, customer.drunkenness)
  end

  def test_customer_can_buy_drink_insufficient_funds
    drink = Drink.new("Gin", 6, 100)
    pub = Pub.new("Chanter", 1000, [drink], 500)
    customer = Customer.new("Kris", 2, 21)

    customer.buy_drink(pub, drink)
    expected = 2
    actual = customer.wallet
    assert_equal(expected, actual)
    assert_equal(1000,pub.till)

  end

  def test_customer_can_afford_drink_true
    drink = Drink.new("Gin", 6, 100)
    customer = Customer.new("Olga", 100, 21)

    expected = true
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_drink_false
    drink = Drink.new("Gin", 6, 100)
    customer = Customer.new("Olga", 4, 21)

    expected = false
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)
  end

  def test_customer_can_buy_drink__under18
    drink = Drink.new("Gin", 6, 100)
    pub = Pub.new("Chanter", 1000, [drink], 500)
    lorna = Customer.new("Lorna", 100, 12)

    lorna.buy_drink(pub, drink)
    expected = 100
    actual = lorna.wallet
    assert_equal(expected, actual)
  end


end
