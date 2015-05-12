class Coffee

  def initialize(coffee_name)
    @coffee_name = coffee_name
    @coffee_level = 3.0
  end

  def full?
    @coffee_level == 3.0
  end 

  def empty?
   @coffee_level == 0.0
  end

  def drink_coffee
    @coffee_level -= 1.0
  end


end