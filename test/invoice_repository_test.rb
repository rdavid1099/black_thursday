require './test/test_helper'
require './lib/invoice_repository'
require './lib/invoice'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_exists
    ir = InvoiceRepository.new("test", self)
    assert_instance_of InvoiceRepository, ir
  end

  def test_it_can_return_an_empty_array_when_there_are_no_known_invoices
    ir = InvoiceRepository.new("path", self)
    assert_equal [], ir.all
  end

   def test_it_adds_an_instance_of_invoice_to_all
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     ir.add_data(invoice_one)

     assert_equal 1, ir.all.count
     assert_instance_of Invoice, ir.all[0]
   end

   def test_it_finds_an_instance_of_invoice_with_matching_id
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     ir.add_data(invoice_one)

     assert_equal 29, ir.find_by_id(29).id
   end

   def test_find_by_id_returns_nil_when_id_doesnt_match
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     ir.add_data(invoice_one)

     assert_equal nil, ir.find_by_id(2990432)
   end

   def test_it_can_find_one_or_more_matches_which_have_matching_customer_id
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     invoice_two = {:id => "30",:customer_id => "7",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     ir.add_data(invoice_one)
     ir.add_data(invoice_two)

     assert_equal 2, ir.find_all_by_customer_id(7).length
   end

   def test_it_can_find_one_or_more_matches_which_have_matching_customer_id
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     invoice_two = {:id => "30",:customer_id => "8",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     invoice_three = {:id => "77",:customer_id => "7",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     ir.add_data(invoice_one)
     ir.add_data(invoice_two)
     ir.add_data(invoice_three)

     assert_equal 1, ir.find_all_by_customer_id(8).count
   end

   def test_it_can_find_one_or_more_matches_which_have_matching_merchant_id
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     invoice_two = {:id => "30",:customer_id => "8",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     invoice_three = {:id => "77",:customer_id => "7",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     ir.add_data(invoice_one)
     ir.add_data(invoice_two)
     ir.add_data(invoice_three)

     assert_equal 1, ir.find_all_by_merchant_id(12334861).count
   end

   def test_it_can_find_one_or_more_matches_which_have_a_matching_status
     ir = InvoiceRepository.new("path", self)
     invoice_one = {:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}
     invoice_two = {:id => "30",:customer_id => "8",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     invoice_three = {:id => "77",:customer_id => "7",:merchant_id => "12334208",:status => "pending", :created_at => "2001-11-24", :updated_at => "2009-11-13"}
     ir.add_data(invoice_one)
     ir.add_data(invoice_two)
     ir.add_data(invoice_three)

     assert_equal 2, ir.find_all_by_status(:pending).count
   end

   def test_invoice_repository_can_read_csv_files
     ir = InvoiceRepository.new("./data/test_invoices.csv", self)

     assert_equal 20, ir.all.length
   end
end
