require './test/test_helper'
require './lib/merchant_repository'

class TestMerchantRepository < Minitest::Test
  def test_can_return_array_of_all_known_merchant_instances
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :creation_date => "05/13/1986"}
    merchant_two = {:id => "123456", :name => "blah", :creation_date => "05/13/1986"}
    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)

    assert_equal 2, mr.all.count
  end

  def test_can_find_an_id_and_return_nil_or_a_matching_merchant
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "12345324", :name => "BObbY", :creation_date => "05/13/1986"}
    merchant_two = {:id => "123456", :name => "blah", :creation_date => "05/13/1986"}
    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)

    assert_equal mr.all[1], mr.find_by_id("123456")
    assert_equal nil, mr.find_by_id("1234352")
  end

  def test_can_find_a_name_and_return_nil_or_a_matching_merchant
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :creation_date => "05/13/1986"}
    merchant_two = {:id => "123458", :name => "Bloop", :creation_date => "05/13/1986"}

    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)
    assert_equal nil, mr.find_by_name("bleh")
    assert_equal "123458", mr.find_by_name("Bloop").id
  end

  def test_it_returns_empty_array_or_matches_of_name_fragment
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :creation_date => "05/13/1986"}
    merchant_two = {:id => "123458", :name => "blah", :creation_date => "05/13/1986"}
    merchant_three = {:id => "123458", :name => "FRANK", :creation_date => "05/13/1986"}

    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)
    mr.add_merchant(merchant_three)
    assert_equal "123456", mr.find_all_by_name("bla")[0].id
    assert_equal [], mr.find_all_by_name("cat")
  end

end
