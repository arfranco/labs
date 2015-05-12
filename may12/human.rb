class Human

  def initialize(name)
    @name = name
    @alertness = 0.0
    @has_coffee = false
  end

  def alertness
    @alertness
  end

  def has_coffee?
   @has_coffee 
  end

  def needs_coffee?
    @has_coffee == false
  end

  def drink!
    @alertness += 0.33
    @coffee.drink_coffee
  end

  def buy(coffee)
    @has_coffee = true
    @coffee = coffee
    true
  end

end



