class Pub

  attr_reader :name, :till, :drinks, :drunkenness_level

  def initialize(name, till, drinks, drunkenness_level)
    @name = name
    @till = till
    @drinks = drinks
    @drunkenness_level = drunkenness_level
  end

  def add_money(amount)
    @till += amount
  end

  def will_serve?(age, drunkenness)
    # Pub checks customer age is over 18 and below drunkenness level before serving
    return true if (age >= 18) && (drunkenness < @drunkenness_level)

    # return true ((if age >= 18) && (if drunkenness > @drunkenness_level))
    #otherwise
    return false
  end
end

# A Pub should have a name, a till, and a collection of drinks


# #The method add_money acts on the pub to add
# #the value of the drink to the till
# till_expected = 1006
# actual_till = pub.add_money(drink.price)
# assert_equal(till_expected, actual_till)
