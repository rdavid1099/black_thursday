require './test/test_helper'
require './lib/invoice_item_repository'

class TestInvoiceItemRepository < Minitest::Test

  def test_invoice_item_repository_exists
    iir = InvoiceItemRepository.new("test", self)

    assert_instance_of InvoiceItemRepository, iir
  end

  def test_repository_receives_self_from_other_classes
    iir = InvoiceItemRepository.new("test", self)

    assert_equal self, iir.sales_engine
  end

  def test_repository_adds_items
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_instance_of InvoiceItem, iir.all[0]
    assert_equal 1, iir.all.length
  end

  def test_invoice_item_repository_can_add_more_than_one_item
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "2", :item_id => "263454779", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    assert_equal 2, iir.all.length
  end

  def test_repository_finds_elements_using_id
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "2", :item_id => "263454779", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal 263519844, iir.find_by_id(1).item_id
    assert_equal 263454779, iir.find_by_id(2).item_id
  end

  def test_repository_returns_nil_if_id_is_incorrect
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "2", :item_id => "263454779", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal nil, iir.find_by_id("2633")
  end

  def test_invoce_item_repository_returns_empty_array_if_item_id_doesnt_match
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal [], iir.find_all_by_item_id("004")
  end

  def test_invoice_item_repository_returns_more_than_one_matches_with_matching_id
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "2", :item_id => "263519844", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "9", :item_id => "263529264", :invoice_id => "2", :quantity => "6", :unit_price => "29973", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal 2, iir.find_all_by_item_id("263519844").length
  end

  def test_invoice_item_repository_returns_more_than_one_matches_with_matching_id
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "2", :item_id => "263519844", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})
    iir.add_data({:id => "9", :item_id => "263529264", :invoice_id => "2", :quantity => "6", :unit_price => "29973", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal 2, iir.find_all_by_invoice_id("1").length
  end

  def test_invoce_item_repository_returns_empty_array_if_invoice_id_doesnt_match
    iir = InvoiceItemRepository.new("test", self)
    iir.add_data({:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"})

    assert_equal [], iir.find_all_by_invoice_id("004")
  end

  def test_it_loads_data_from_csv_file
    iir = InvoiceItemRepository.new("./data/test_invoice_items.csv", self)

    assert_equal 20, iir.all.length
  end

end
