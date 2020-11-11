class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def total_inventory
    result = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        if result.key?(item)
          result[item][:quantity] += amount
          result[item][:vendors] << vendor
        else
          result[item] = {:quantity => amount, :vendors => [vendor]}
        end
      end
    end
    result
  end

  def overstocked_items
    results = []
    total = total_inventory
    overstocked = total.find_all do |item, info|
      info[:quantity] > 50 || info[:vendors].length > 1
    end
    overstocked.each do |item|
      results << item[0]
    end

    results
  end
end