require './test/test_helper'
require './lib/sales_analyst'
require './lib/sales_engine'
require './lib/item'

class TestSalesAnalyst < Minitest::Test
  def setup
    @se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv", :invoices => "./data/invoices.csv"})
  end
  #
  # def test_sales_analyst_can_receive_sales_engine
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of SalesAnalyst, sa
  # end
  #
  # def test_sales_analyst_knows_total_number_of_items
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal true, sa.total_num_of_items > 30
  # end
  #
  # def test_sales_analyst_knows_total_number_of_merchants
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal true, sa.total_num_of_merchants > 30
  # end
  #
  # def test_analyst_returns_zero_if_item_number_is_zero
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal 0, sa.validate_number_of_items(nil)
  # end
  #
  # def test_analyst_creates_array_of_total_items_by_each_merchant
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Array, sa.num_of_merchants_items
  #   assert_equal true, sa.num_of_merchants_items.length > 15
  #   assert_equal 1367, sa.num_of_merchants_items.inject(:+)
  # end
  #
  # def test_sales_analyst_calculates_average_amount_of_items_per_merchant
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Float, sa.average_items_per_merchant
  #   assert_equal false, sa.average_items_per_merchant < 1
  # end
  #
  # def test_sales_analyst_calculates_standard_deviation_of_average
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Float, sa.average_items_per_merchant_standard_deviation
  # end
  #
  # def test_analyst_returns_array_of_merchants
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Array, sa.merchants_with_high_item_count
  # end
  #
  # def test_analyst_returns_array_of_merchants_with_the_most_items_for_sale
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.merchants_with_high_item_count.all? do |merchant|
  #     merchant.items.length > 5
  #   end
  #
  #   assert_equal true, expected
  # end
  #
  # def test_average_price_of_items_returns_average
  #   sa = SalesAnalyst.new(@se)
  #   item1 = Item.new({:id => "0", :name => "test", :description => "test.", :unit_price => "200", :merchant_id => "0", :created_at  => "2016-01-11", :updated_at  => "1999-09-10"}, self)
  #   item2 = Item.new({:id => "0", :name => "test", :description => "test.", :unit_price => "300", :merchant_id => "0", :created_at  => "2016-01-11", :updated_at  => "1999-09-10"}, self)
  #   item3 = Item.new({:id => "0", :name => "test", :description => "test.", :unit_price => "400", :merchant_id => "0", :created_at  => "2016-01-11", :updated_at  => "1999-09-10"}, self)
  #   items = [item1, item2, item3]
  #
  #   assert_equal 3.0, sa.find_average_price_of_items(items).to_f
  # end
  #
  # def test_it_can_calculate_the_average_item_price_per_merchant
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of BigDecimal, sa.average_item_price_for_merchant(12334471)
  #   assert_equal 5.0, sa.average_item_price_for_merchant(12334471).to_f
  # end
  #
  # def test_analyst_can_find_the_average_of_averages_among_merchants
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of BigDecimal, sa.average_average_price_per_merchant
  # end
  #
  # def test_it_can_calculate_std_deviation_from_average_of_average
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Array, sa.golden_items
  # end
  #
  # def test_analyst_generates_array_of_merchant_invoices
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.generate_total_invoices_of_each_merchant
  #
  #   assert_instance_of Array, expected
  #   assert_equal true, expected.length > 200
  # end
  #
  # def test_analyst_average_number_of_invoices_per_merchant
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.average_invoices_per_merchant
  #
  #   assert_equal 10.49, expected
  # end
  #
  # def test_analyst_finds_std_deviation_of_merchants_and_invoices
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.average_invoices_per_merchant_standard_deviation
  #
  #   assert_equal 3.29, expected
  # end
  #
  # def test_analyst_finds_top_performing_merchants_using_std_dev
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.top_merchants_by_invoice_count
  #
  #   assert_instance_of Array, expected
  #   assert_equal true, expected[0].invoices.length > 17
  # end
  #
  # def test_analyst_finds_lowest_performing_merchants_using_std_dev
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.bottom_merchants_by_invoice_count
  #
  #   assert_instance_of Array, expected
  #   assert_equal true, expected[0].invoices.length < 4
  # end
  #
  # def test_analyst_finds_top_days_comparing_invoice_counts
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.top_days_by_invoice_count
  #
  #   assert_instance_of Array, expected
  #   assert_equal true, expected.include?("Saturday")
  #   assert_equal false, expected.length > 3
  # end

  def test_analyst_calculates_percentage_of_invoices_sitting_at_given_status
    sa = SalesAnalyst.new(@se)
    
  end
end
