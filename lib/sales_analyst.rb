require_relative '../lib/math_engine'

class SalesAnalyst
  include MathEngine

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
    find_average(num_of_merchants_items).round(2)
  end

  def average_items_per_merchant_standard_deviation
    standard_deviation(
      num_of_merchants_items,
      average_items_per_merchant,
      total_num_of_merchants
    )
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
    target = above_std_dev(
      average_items_per_merchant,
      average_items_per_merchant_standard_deviation
    )
    find_merchants_with_high_item_count(target)
  end

  def find_merchants_with_high_item_count(target)
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
    find_average(item_prices)
  end

  def average_average_price_per_merchant
    find_average(average_item_price_for_merch).round(2)
  end

  def golden_items
    target = above_std_dev(
      average_average_price_per_merchant,
      average_price_per_merchant_standard_deviation,
      2
    )
    find_golden_items(target)
  end

  def find_golden_items(target)
    sales_engine.items.all.find_all do |item|
      item.unit_price_to_dollars > target
    end
  end

  def average_price_per_merchant_standard_deviation
    standard_deviation(
      average_item_price_for_merch,
      average_average_price_per_merchant,
      total_num_of_items
    )
  end
end
