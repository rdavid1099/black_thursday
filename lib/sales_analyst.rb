require_relative '../lib/math_engine'

class SalesAnalyst
  include MathEngine

  attr_reader :sales_engine,
              :total_num_of_items,
              :total_num_of_merchants,
              :total_num_of_invoices,
              :total_num_of_customers,
              :num_of_merchants_items,
              :num_of_merchants_invoices,
              :average_item_price_for_merch

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @total_num_of_items = sales_engine.items.all.length
    @total_num_of_merchants = sales_engine.merchants.all.length
    @total_num_of_invoices = sales_engine.invoices.all.length
    @total_num_of_customers = sales_engine.invoices.all.length
    @num_of_merchants_items = generate_total_items_of_each_merchant
    @num_of_merchants_invoices = generate_total_invoices_of_each_merchant
    @average_item_price_for_merch = generate_item_price_per_merch
  end

  def average_items_per_merchant
    find_average(num_of_merchants_items).round(2)
  end

  def average_average_price_per_merchant
    find_average(average_item_price_for_merch).round(2)
  end

  def average_invoices_per_merchant
    find_average(num_of_merchants_invoices).round(2)
  end

  def average_item_price_for_merchant(merch_id)
    merchant_items = sales_engine.items.find_all_by_merchant_id(merch_id)
    find_average_price_of_items(merchant_items).round(2)
  end

  def average_invoices_created_per_day
    invoice_creation = split_invoices_by_creation_date
    find_average(invoice_creation).round(2)
  end

  def find_average_price_of_items(items)
    item_prices = items.map do |item|
      item.unit_price
    end
    item_prices = [BigDecimal.new(0, 4)/100] if item_prices.empty?
    find_average(item_prices)
  end

  def average_items_per_merchant_standard_deviation
    standard_deviation(
      num_of_merchants_items,
      average_items_per_merchant,
      total_num_of_merchants
    )
  end

  def average_price_per_merchant_standard_deviation
    standard_deviation(
      average_item_price_for_merch,
      average_average_price_per_merchant,
      total_num_of_items
    )
  end

  def average_invoices_per_merchant_standard_deviation
    standard_deviation(
      num_of_merchants_invoices,
      average_invoices_per_merchant,
      total_num_of_merchants
    )
  end

  def average_invoices_per_day_standard_deviation
    standard_deviation(
      split_invoices_by_creation_date,
      average_invoices_created_per_day,
      7
    )
  end

  def merchants_with_high_item_count
    target = above_std_dev(
      average_items_per_merchant,
      average_items_per_merchant_standard_deviation
    )
    find_merchants_with_high_item_count(target)
  end

  def top_merchants_by_invoice_count
    target = above_std_dev(
      average_invoices_per_merchant,
      average_invoices_per_merchant_standard_deviation,
      2
    )
    find_merchants_with_high_invoice_count(target)
  end

  def bottom_merchants_by_invoice_count
    target = below_std_dev(
      average_invoices_per_merchant,
      average_invoices_per_merchant_standard_deviation,
      2
    )
    find_merchants_with_low_invoice_count(target)
  end

  def find_merchants_with_low_invoice_count(target)
    sales_engine.merchants.all.find_all do |merchant|
      merchant.invoices.length < target
    end
  end

  def find_merchants_with_high_invoice_count(target)
    sales_engine.merchants.all.find_all do |merchant|
      merchant.invoices.length > target
    end
  end

  def find_merchants_with_high_item_count(target)
    sales_engine.merchants.all.find_all do |merchant|
      merchant.items.length > target
    end
  end

  def invoice_status(status)
    (
    (count_of_matched_invoice_status(status) / total_num_of_invoices.to_f) * 100
    ).round(2)
  end

  def count_of_matched_invoice_status(status)
    sales_engine.invoices.all.reduce(0) do |result, invoice|
      result += 1 if invoice.status == status
      result
    end
  end

  def top_days_by_invoice_count
    target = above_std_dev(
      average_invoices_created_per_day,
      average_invoices_per_day_standard_deviation,
    )
    find_top_days_by_invoice_count(target)
  end

  def find_top_days_by_invoice_count(target)
    days = ["Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"]
    split_invoices_by_creation_date.map.with_index do |invoices_on_day, i|
      days[i] if invoices_on_day > target
    end.compact
  end

  def total_revenue_by_date(date)
    invoice_items_to_total = generate_requested_invoice_items(date)
    invoice_items_to_total.reduce(0) do |result, invoice_item|
      result += (invoice_item.unit_price * invoice_item.quantity)
      result
    end
  end

  def generate_requested_invoice_items(date)
    date = Time.parse(date) if date.class == String
    related_invoices = sales_engine.invoices.all.find_all do |invoice|
      invoice.created_at.strftime("%Y%m%d") == date.strftime("%Y%m%d")
    end
    related_invoices.map do |invoice|
      sales_engine.invoice_items.find_all_by_invoice_id(invoice.id)
    end.flatten
  end

  def top_revenue_earners(amount = 20)
    merchants_and_invoices = assign_merchant_ids_to_invoice_ids
    top_earner_revenues = merchants_and_invoices.values.sort.reverse
    top_earner_revenues.map.with_index do |revenue, i|
      merchants_and_invoices.invert[revenue] if i < amount
    end.compact
  end

  def assign_merchant_ids_to_invoice_ids
    sales_engine.merchants.all.reduce({}) do |result, merchant|
      result[merchant] = find_merchant_total_revenue(merchant.invoices)
      result
    end
  end

  def find_merchant_total_revenue(invoices)
    invoice_items = invoices.map do |invoice|
      sales_engine.invoice_items.find_all_by_invoice_id(invoice.id)
    end.flatten
    invoice_items.reduce(0) do |result, invoice_item|
      result += (invoice_item.unit_price * invoice_item.quantity)
      result
    end
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

  def split_invoices_by_creation_date
    sales_engine.invoices.all.reduce(Array.new(7,0)) do |result, invoice|
      creation_date = invoice.created_at
      result[creation_date.wday] += 1
      result
    end
  end

  def generate_total_invoices_of_each_merchant
    sales_engine.merchants.all.map do |merchant|
      validate_number(merchant.invoices)
    end
  end

  def generate_total_items_of_each_merchant
    sales_engine.merchants.all.map do |merchant|
      validate_number(merchant.items)
    end
  end

  def generate_item_price_per_merch
    sales_engine.merchants.all.map do |merchant|
      average_item_price_for_merchant(merchant.id)
    end
  end

  def validate_number(data)
    return data.length unless data.nil?
    0
  end
end
