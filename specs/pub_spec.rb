require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")


class TestPub < MiniTest::Test

  # A Pub should have a name, a till, a collection of drinks and
  # a maximum drunkenness level tolerated by refusing to serve
  # a customer
  def test_pub_has_name
    cloisters = Pub.new("Cloisters", 250, [])
    expected = "Cloisters"
    result = cloisters.name
    assert_equal(expected, result)
  end

  def test_pub_has_money_in_till
    cloisters = Pub.new("Cloisters", 250, [], 500)
    expected = 250
    result = cloisters.till
    assert_equal(expected, result)
  end

  def test_pub_has_drinks
    tennants = Drink.new("Tennants", 5)
    gin = Drink.new("Gin", 7)
    drinks = [tennants, gin]
    cloisters = Pub.new("Cloisters", 250, drinks, 500)
    expected = drinks
    result = cloisters.drinks
    assert_equal(expected, result)
  end

  def test_add_money_to_till
    tennants = Drink.new("Tennants", 5)
    gin = Drink.new("Gin", 7)
    drinks = [tennants, gin]
    ccs = Pub.new("ccs", 1000, drinks, 500)
    expected = 1010
    result = ccs.add_money(10)
  end


  def test_pub_will_serve_customer__over18
    ccs = Pub.new("ccs", 1000, [], 500)
    kris = Customer.new("Kris", 50, 42)
    # we don't need any drinks as we're not buying!
    customer_age = kris.age
    customer_drunkenness = kris.drunkenness
    expected = true
    actual = ccs.will_serve?(customer_age, customer_drunkenness)
    assert_equal(expected, actual)
  end

  def test_pub_will_not_serve_customer__under18
    ccs = Pub.new("ccs", 1000, [], 500)
    jennifer = Customer.new("Jennifer", 50, 16)
    # we don't need any drinks as we're not buying!
    customer_age = jennifer.age
    customer_drunkenness = kris.drunkenness
    expected = false
    actual = ccs.will_serve?(customer_age, customer_drunkenness)
    assert_equal(expected, actual)
  end

  def test_pub_will_not_serve_customer__too_drunk
    # tennants = Drink.new("Tennants", 5, 80)
    # gin = Drink.new("Gin", 7, 70)
    # drinks = [tennants, gin]
    # test to check pub will refuse service if customer
    # if too drunk but still over 18
    ccs = Pub.new("ccs", 1000, [], 120)
    kris = Customer.new("Kris", 50, 42, 150)

    customer_age = kris.age
    customer_drunkenness = kris.drunkenness
    expected = false
    actual = ccs.will_serve?(customer_age, customer_drunkenness)
    assert_equal(expected, actual)
  end
end
