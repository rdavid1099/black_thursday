require './test/test_helper'
require './lib/invoice_repository'
require './lib/invoice'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_exists
    ir = InvoiceRepository.new("test", self)
    assert_instance_of InvoiceRepository, ir
  end

  def test_it_can_receive_pathname_and_self
    ir = InvoiceRepository.new("path", self)
    assert_equal "path", ir.pathname
    assert_equal self, ir.sales_engine
  end

  def test_it_can_return_an_empty_array_when_there_are_no_known_invoices
    ir = InvoiceRepository.new("path", self)
    assert_equal [], ir.all
  end

   def test_it_adds_an_instance_of_invoice_to_all
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     ir.add_invoice(invoice_one)

     assert_equal 1, ir.all.count
     assert_instance_of Invoice, ir.all[0]
   end

   def test_it_finds_an_instance_of_invoice_with_matching_id
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     ir.add_invoice(invoice_one)

end
