class Coffee
  def temperature
    250.0
  end

  def color
    milk? ? :light : :dark
  end

  def price
    milk? ? 1.25 : 1.00
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
