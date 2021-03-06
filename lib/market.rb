require 'date'

class Market
  attr_reader :name,
              :vendors,
              :date

  def initialize(name)
    @name = name
    @vendors = []
    # @date = get_date
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
    overstocked = total_inventory.find_all do |item, info|
      info[:quantity] > 50 && info[:vendors].length > 1
    end

    overstocked.each do |item|
      results << item[0]
    end

    results
  end

  def sorted_item_list
    names = []
    total_inventory.each do |item, info|
      names << item.name
    end
    names.sort
  end

  # def get_date
  #   date = Date.today.strftime("%d/%m/%Y")
  #   require 'pry'; binding.pry
  # end
end