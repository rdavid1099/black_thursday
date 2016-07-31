require './test/test_helper'
require './lib/customer_repository'
require './lib/sales_engine'

class TestCustomerRepository < Minitest::Test

  def test_can_return_array_of_all_known_customer_instances
    cr = CustomerRepository.new("test", self)
    customer_one = {:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}
    customer_two = {:id => 9, :first_name => "Dejon", :last_name => "Fadel", :created_at => "2012-03-27 14:54:11 UTC", :updated_at => "2012-03-27 14:54:11 UTC"}

    cr.add_data(customer_one)
    cr.add_data(customer_two)

    assert_equal 2, cr.all.count
  end

  def test_it_returns_nil_or_an_instance_of_customer_with_a_matching_id
    cr = CustomerRepository.new("test", self)
    customer_one = {:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}
    customer_two = {:id => 9, :first_name => "Dejon", :last_name => "Fadel", :created_at => "2012-03-27 14:54:11 UTC", :updated_at => "2012-03-27 14:54:11 UTC"}

    cr.add_data(customer_one)
    cr.add_data(customer_two)

    assert_equal cr.all[1], cr.find_by_id(9)
    assert_equal nil, cr.find_by_id(1234352)
  end

  def test_returns_one_or_more_matches_which_have_a_first_name_matching_the_substring_fragment
    cr = CustomerRepository.new("test", self)
    customer_one = {:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}
    customer_two = {:id => 9, :first_name => "Dejon", :last_name => "Fadel", :created_at => "2012-03-27 14:54:11 UTC", :updated_at => "2012-03-27 14:54:11 UTC"}

    cr.add_data(customer_one)
    cr.add_data(customer_two)
    assert_equal 1, cr.find_all_by_first_name("Dej").length
  end

  def test_returns_an_empty_array_if_no_matching_substring_for_first_name
    cr = CustomerRepository.new("test", self)
    customer_one = {:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}
    customer_two = {:id => 9, :first_name => "Dejon", :last_name => "Fadel", :created_at => "2012-03-27 14:54:11 UTC", :updated_at => "2012-03-27 14:54:11 UTC"}

    cr.add_data(customer_one)
    assert_equal [], cr.find_all_by_first_name("bleh")
  end

  def test_returns_an_empty_array_if_no_matching_substring_for_last_name
    cr = CustomerRepository.new("test", self)
    customer_one = {:id => 2, :first_name => "Cecelia", :last_name => "Osinski", :created_at => "2012-03-27 14:54:10 UTC", :updated_at => "2012-03-27 14:54:10 UTC"}

    cr.add_data(customer_one)
    assert_equal [], cr.find_all_by_last_name("bleh")
  end

  def test_it_loads_data_from_file
    cr = CustomerRepository.new("./data/test_customers.csv", self)

    assert_equal 20, cr.all.length
  end
end
