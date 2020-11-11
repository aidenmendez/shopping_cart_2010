class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if !@inventory.include?(item)
      0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    if @inventory.include?(item)
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    inventory.map do |item, amount|
      item.price * amount
    end.sum
  end
end