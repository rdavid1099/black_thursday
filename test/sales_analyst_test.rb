require './test/test_helper'
require './lib/sales_analyst'
require './lib/sales_engine'

class TestSalesAnalyst < Minitest::Test
  def setup
    se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
    @sa = SalesAnalyst.new(se)
  end


  def test_sales_analyst_can_receive_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_instance_of SalesAnalyst, sa
  end

  def test_sales_analyst_knows_total_number_of_items
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_equal true, sa.total_num_of_items > 30
  end

  def test_sales_analyst_knows_total_number_of_merchants
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_equal true, sa.total_num_of_merchants > 30
  end

  def test_analyst_returns_zero_if_item_number_is_zero
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_equal 0, sa.validate_number_of_items(nil)
  end

  def test_analyst_creates_array_of_total_items_by_each_merchant
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_instance_of Array, sa.num_of_merchants_items
    assert_equal true, sa.num_of_merchants_items.length > 15
    assert_equal 6, sa.num_of_merchants_items.inject(:+)
  end

  def test_sales_analyst_calculates_average_amount_of_items_per_merchant
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    sa = SalesAnalyst.new(se)

    assert_instance_of Float, sa.average_items_per_merchants
    assert_equal true, sa.average_items_per_merchants < 1
  end

  def test_sales_analyst_calculates_standard_deviation_of_average

    assert_instance_of Float, @sa.average_items_per_merchant_standard_deviation
  end

  def test_analyst_returns_array_of_merchants
    hc = @sa.merchants_with_high_item_count

    assert_instance_of Array, hc
  end

  def test_analyst_returns_array_of_merchants_with_the_most_items_for_sale
  end
end
