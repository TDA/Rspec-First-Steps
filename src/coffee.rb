class Coffee
  def temperature
    250.0
  end

  def color
    milk? ? :light : :dark
  end

  def price
    if milk?
      1.25
    else
      1.00
    end
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def ingredients
    @ingredients ||= []
  end

  private
  def milk?
    ingredients.include?(:milk)
  end
end
