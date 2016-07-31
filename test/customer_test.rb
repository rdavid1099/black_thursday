require './test/test_helper'
require './lib/customer'
require './lib/sales_engine'
class TestCustomer < Minitest::Test

  def test_customer_has_an_id
    customer = Customer.new({:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}, self)
    id = 2

    assert_equal id, customer.id
  end

  def test_customer_has_a_first_name
    customer = Customer.new({:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}, self)
    fn = "Cecelia"

    assert_equal fn, customer.first_name
  end

  def test_customer_has_a_last_name
    customer = Customer.new({:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}, self)
    ln = "Osinski"

    assert_equal ln, customer.last_name
  end

  def test_it_returns_time_instance_for_date_customer_was_created
    customer = Customer.new({:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}, self)
    created = Time.parse("2012-03-27 14:54:10 UTC")

    assert_equal created, customer.created_at
  end

  def test_it_returns_time_instance_for_date_customer_was_updated
    customer = Customer.new({:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}, self)
    updated = Time.parse("2012-03-27 14:54:10 UTC")

    assert_equal updated, customer.updated_at
  end


end
