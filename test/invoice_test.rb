require './test/test_helper'
require './lib/invoice'

class InvoiceTest < Minitest::Test
# customer_id - returns the customer id
# merchant_id - returns the merchant id
# status - returns the status
# created_at - returns a Time instance for the date the item was first created
# updated_at - returns a Time instance for the date the item was last modified

  def test_it_returns_an_integer_id
    invoice = Invoice.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"})
    id = 12334105

    assert_equal id, invoice.id
  end

  def test_it_returns_the_customer_id
    invoice = Invoice.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"})
    customer_id = "Shopin1901"

    assert_equal customer_id, invoice.customer_id
  end
end
