require 'pry'

class SalesAnalyst
  attr_reader :sales_engine,
              :total_num_of_items,
              :total_num_of_merchants,
              :num_of_merchants_items

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @total_num_of_items = sales_engine.items.all.length
    @total_num_of_merchants = sales_engine.merchants.all.length
    @num_of_merchants_items = generate_total_items_of_each_merchant
  end

  def average_items_per_merchants
    num_of_merchants_items.reduce(:+) / num_of_merchants_items.length.to_f
  end

  def average_items_per_merchant_standard_deviation
    Math.sqrt(difference_of_merchant_items_and_average / total_num_of_merchants - 1)
  end

  def difference_of_merchant_items_and_average
    num_of_merchants_items.reduce(0) do |result, number|
      result += ((number - average_items_per_merchants)**2)
      result
    end
  end

  def generate_total_items_of_each_merchant
    sales_engine.merchants.all.map do |merchant|
      validate_number_of_items(merchant.items)
    end
  end

  def validate_number_of_items(items)
    return items.length unless items.nil?
    0
  end
end
