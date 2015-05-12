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
    false
  end

  def needs_coffee?
    true
  end

  def drink!
    @alertness += 0.33
  end

  def buy(coffee)
    @has_coffee = true
    @coffee = coffee
  end

end



