require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def test_customer_has_name
    customer = Customer.new("Olga", 30)
    assert_equal("Olga", customer.name)
  end

  def test_customer_has_money
    customer = Customer.new("Olga", 30)
    assert_equal(30, customer.wallet)
  end

end
