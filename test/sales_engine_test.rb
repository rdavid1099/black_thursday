require './test/test_helper'
require './lib/sales_engine'

class TestSalesEngine < Minitest::Test
  def test_sales_engine_exists
    assert_instance_of SalesEngine, SalesEngine.new
  end

  def test_hash_of_pathnames_can_be_passed_into_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})

    assert_instance_of ItemRepository, se.items
    assert_instance_of MerchantRepository, se.merchants
  end

  def test_instance_of_merchants_can_be_assigned_to_a_variable
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants

    assert_instance_of MerchantRepository, mr
  end

  def test_merchants_can_find_by_name_from_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants
    merchant = mr.find_by_name("DenesDoorDecor")
    no_merchant = mr.find_by_name("NOT A NAME")

    assert_equal "DenesDoorDecor", merchant.name
    assert_equal nil, no_merchant
  end

  def test_instance_of_item_repository_can_be_saved_to_variable
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    ir = se.items

    assert_instance_of ItemRepository, ir
  end

  def test_items_can_find_by_name_from_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    ir = se.items
    item = ir.find_by_name("Test listing")

    assert_equal "263410685", item.id
    assert_instance_of Item, item
  end

end
