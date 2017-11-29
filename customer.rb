class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def can_afford?(drink)
    # Check if customer's wallet is greater than or equal
    # to the drink price
    # @wallet >= drink.price
    return true if @wallet >= drink.price
    return false if @wallet < drink.price
  end

  def buy_drink(pub, drink)
    # check if pub will serve customer
    # check if customer can afford drink
    if can_afford?(drink) && pub.will_serve?(@age)
      # step 1. customer wallet reduces by price of
      # drink.
      @wallet -= drink.price
      # step 2. pub till increases by drink sold value.
      pub.add_money(drink.price)
      # step 3. customer drunkenness increases by
      # alcohol_level of the drink
      @drunkenness += drink.alcohol_level
    else
      return "Transaction declined"
    end
  end


end
