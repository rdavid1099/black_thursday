require './test/test_helper'
require './lib/invoice'

class InvoiceTest < Minitest::Test

  def test_invoice_can_receive_a_hash_and_self
    invoice = Invoice.new({:status => "returned", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)

    assert_equal :returned, invoice.status
  end

  def test_it_returns_an_integer_id
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    id = 29

    assert_equal id, invoice.id
  end

  def test_it_returns_the_customer_id
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    customer_id = 7

    assert_equal customer_id, invoice.customer_id
  end

  def test_it_returns_the_merchant_id
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    merchant_id = 12334861

    assert_equal merchant_id, invoice.merchant_id
  end

  def test_it_returns_the_status
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)
    status= :shipped

    assert_equal status, invoice.status
  end

  def test_it_returns_a_Time_instance_for_the_date_the_item_was_first_created
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)

    assert_instance_of Time, invoice.created_at
    assert_equal Time.parse("2008-09-21"), invoice.created_at
  end

  def test_it_returns_a_time_instance_for_the_date_the_item_was_last_modified
    invoice = Invoice.new({:id => "29",:customer_id => "7",:merchant_id => "12334861",:status => "shipped", :created_at => "2008-09-21", :updated_at => "2010-10-21"}, self)

    assert_instance_of Time, invoice.updated_at
  end

end
