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


  # def test_can_return_array_of_all_known_invoice_item_instances
  #   iir = InvoiceItemRepository.new("test", self)
  #   invoice_item_one = {:id => "1", :item_id => "263519844", :invoice_id => "1", :quantity => "5", :unit_price => "13635", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"}
  #   invoice_item_two = {:id => "2", :item_id => "263454779", :invoice_id => "1", :quantity => "9", :unit_price => "23324", :created_at => "2012-03-27 14:54:09 UTC", :updated_at => "2012-03-27 14:54:09 UTC"}
  #
  #   iir.add_data(invoice_item_one)
  #   # iir.add_data(invoice_item_two)
  #
  #   assert_equal 2, iir.all.count
  # end

end
