class SalesAnalyst
  attr_reader :sales_engine,
              :total_num_of_items,
              :total_num_of_merchants,
              :num_of_merchants_items,
              :average_item_price_for_merch

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @total_num_of_items = sales_engine.items.all.length
    @total_num_of_merchants = sales_engine.merchants.all.length
    @num_of_merchants_items = generate_total_items_of_each_merchant
    @average_item_price_for_merch = generate_item_price_per_merch
  end

  def average_items_per_merchant
    (num_of_merchants_items.reduce(:+) / num_of_merchants_items.length.to_f).round(2)
  end

  def average_items_per_merchant_standard_deviation
    Math.sqrt(sum_of_merchant_items_average / total_num_of_merchants).round(2)
  end

  def sum_of_merchant_items_average
    num_of_merchants_items.reduce(0) do |result, number|
      result += ((number - average_items_per_merchant)**2)
      result
    end
  end

  def generate_total_items_of_each_merchant
    sales_engine.merchants.all.map do |merchant|
      validate_number_of_items(merchant.items)
    end
  end

  def generate_item_price_per_merch
    sales_engine.merchants.all.map do |merchant|
      average_item_price_for_merchant(merchant.id)
    end
  end

  def validate_number_of_items(items)
    return items.length unless items.nil?
    0
  end

  def merchants_with_high_item_count
    target = average_items_per_merchant_standard_deviation + average_items_per_merchant
    sales_engine.merchants.all.find_all do |merchant|
      merchant.items.length > target
    end
  end

  def average_item_price_for_merchant(merch_id)
    merchant_items = sales_engine.items.find_all_by_merchant_id(merch_id)
    find_average_price_of_items(merchant_items).round(2)
  end

  def find_average_price_of_items(items)
    item_prices = items.map do |item|
      item.unit_price
    end
    item_prices.reduce(:+) / items.length
  end

  def average_average_price_per_merchant
    (average_item_price_for_merch.reduce(:+) / sales_engine.merchants.all.length).round(2)
  end

  def golden_items
    target = average_average_price_per_merchant + (average_price_per_merchant_standard_deviation * 2)
    sales_engine.items.all.find_all do |item|
      item.unit_price_to_dollars > target
    end
  end

  def average_price_per_merchant_standard_deviation
    Math.sqrt(sum_of_item_price_differences / total_num_of_items)
  end

  def sum_of_item_price_differences
    average_item_price_for_merch.reduce(0) do |result, number|
      result += ((number - average_average_price_per_merchant)**2)
      result
    end
  end
end
