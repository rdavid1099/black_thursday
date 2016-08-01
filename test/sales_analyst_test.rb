require './test/test_helper'
require './lib/sales_analyst'
require './lib/sales_engine'
require './lib/invoice'

require './lib/item'

class TestSalesAnalyst < Minitest::Test
  def setup
    # @se = SalesEngine.from_csv({:items => "./data/items.csv",
    #                             :merchants => "./data/merchants.csv",
    #                             :invoices => "./data/invoices.csv",
    #                             :transactions => "./data/transactions.csv",
    #                             :customers => "./data/customers.csv",
                                # :invoice_items => "./data/invoice_items.csv"}})
    @se = SalesEngine.from_csv({:items => "./data/test_items.csv",
                                :merchants => "./data/test_merchants.csv",
                                :invoices => "./data/test_invoices.csv",
                                :transactions => "./data/test_transactions.csv",
                                :customers => "./data/test_customers.csv",
                                :invoice_items => "./data/test_invoice_items.csv"})
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
  #   assert_equal 20, sa.total_num_of_items
  # end
  #
  # def test_sales_analyst_knows_total_number_of_merchants
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal 20, sa.total_num_of_merchants
  # end
  #
  # def test_analyst_returns_zero_if_item_number_is_zero
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal 0, sa.validate_number(nil)
  # end
  #
  # def test_analyst_creates_array_of_total_items_by_each_merchant
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_instance_of Array, sa.num_of_merchants_items
  #   assert_equal true, sa.num_of_merchants_items.length > 15
  #   assert_equal 20, sa.num_of_merchants_items.inject(:+)
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
  #     merchant.items.length > 1
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
  #   assert_instance_of BigDecimal, sa.average_item_price_for_merchant(16)
  #   assert_equal 81.48, sa.average_item_price_for_merchant(16).to_f
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
  #   assert_equal true, expected.length > 10
  # end
  #
  # def test_analyst_average_number_of_invoices_per_merchant
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.average_invoices_per_merchant
  #
  #   assert_equal 1.0, expected
  # end
  #
  # def test_analyst_finds_std_deviation_of_merchants_and_invoices
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.average_invoices_per_merchant_standard_deviation
  #
  #   assert_equal 1.08, expected
  # end
  #
  # def test_analyst_finds_top_performing_merchants_using_std_dev
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.top_merchants_by_invoice_count
  #
  #   assert_instance_of Array, expected
  #   assert_equal true, expected[0].invoices.length > 1
  # end
  #
  # def test_analyst_finds_lowest_performing_merchants_using_std_dev
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.bottom_merchants_by_invoice_count
  #
  #   assert_instance_of Array, expected
  # end
  #
  # def test_analyst_finds_top_days_comparing_invoice_counts
  #   sa = SalesAnalyst.new(@se)
  #   expected = sa.top_days_by_invoice_count
  #
  #   assert_instance_of Array, expected
  #   assert_equal false, expected.length > 3
  # end
  #
  # def test_analyst_calculates_percentage_of_invoices_sitting_at_given_status
  #   sa = SalesAnalyst.new(@se)
  #
  #   assert_equal true, sa.invoice_status(:pending) < 50
  #   assert_equal true, sa.invoice_status(:shipped) > 50
  #   assert_equal true, sa.invoice_status(:returned) < 20
  # end

  def test_analyst_has_total_number_of_customers
    sa = SalesAnalyst.new(@se)

    assert_equal 20, sa.total_num_of_customers
  end

  def test_analyst_has_total_revenue_by_date
    sa = SalesAnalyst.new(@se)

    assert_respond_to sa, :total_revenue_by_date
  end

  def test_total_revenue_by_date_can_receive_a_date
    sa = SalesAnalyst.new(@se)
    date = Time.parse("2012-03-27")

    assert sa.total_revenue_by_date(date)
  end

  def test_date_comparison_returns_an_array_of_invoice_items_on_given_dates
    sa = SalesAnalyst.new(@se)
    date = "2012-03-27"

    assert_equal 20, sa.generate_requested_invoice_items(date).length
  end

  def test_total_revenue_is_returned_for_given_day
    sa = SalesAnalyst.new(@se)
    date = "2012-03-27"

    assert_instance_of BigDecimal, sa.total_revenue_by_date(date)
    assert_equal true, sa.total_revenue_by_date(date) > 23000
  end

  def test_total_revenue_is_returned_for_given_day
    sa = SalesAnalyst.new(@se)
    date = Time.parse("2012-03-27")

    assert_instance_of BigDecimal, sa.total_revenue_by_date(date)
    assert_equal true, sa.total_revenue_by_date(date) > 23000
  end

  def test_analyst_knows_top_revenue_earners
    sa = SalesAnalyst.new(@se)

    assert_respond_to sa, :top_revenue_earners
  end

  def test_top_revenue_earners_can_take_a_value
    sa = SalesAnalyst.new(@se)

    assert sa.top_revenue_earners(5)
  end

  def test_top_revenue_earners_has_a_default_value_of_20
    sa = SalesAnalyst.new(@se)

    assert sa.top_revenue_earners
  end

  def test_analyst_makes_hash_of_merchant_ids_and_invoices
    sa = SalesAnalyst.new(@se)

    assert_equal 20, sa.assign_merchant_ids_to_invoice_ids.length
    assert_instance_of Merchant, sa.assign_merchant_ids_to_invoice_ids.keys[0]
    assert_instance_of BigDecimal, sa.assign_merchant_ids_to_invoice_ids.values[0]
  end

  def test_analyst_finds_merchant_total_revenue
    sa = SalesAnalyst.new(@se)
    i1 = Invoice.new({:id => "2",:customer_id => "1",:merchant_id => "11",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    i2 = Invoice.new({:id => "3",:customer_id => "2",:merchant_id => "12",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    invoices = [i1, i2]

    assert_instance_of BigDecimal, sa.find_merchant_total_revenue(invoices)
  end

  def test_analyst_finds_given_number_of_top_earners
    sa = SalesAnalyst.new(@se)

    assert_equal 3, sa.top_revenue_earners(3).length
    assert_equal 20, sa.top_revenue_earners.length
    assert_instance_of Merchant, sa.top_revenue_earners(3)[0]
  end
end
