require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")

class TestPub < MiniTest::Test

  # A Pub should have a name, a till, and a collection of drinks
  def test_pub_has_name
    cloisters = Pub.new("Cloisters", 250, [])
    expected = "Cloisters"
    result = cloisters.name
    assert_equal(expected, result)
  end

end
