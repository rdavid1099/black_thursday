require './test/test_helper'
require './lib/merchant_repository'

class TestMerchantRepository < Minitest::Test
  def test_can_return_array_of_all_known_merchant_instances
    merchant_one = Merchant.new({:id => "123456", :name => "blah", :creation_date => "05/13/1986"}, self)
    merchant_two = Merchant.new({:id => "123456", :name => "blah", :creation_date => "05/13/1986"}, self)

    merchant_repository = MerchantRepository.new([merchant_one, merchant_two])
    assert_equal 2, merchant_repository.all.count
  end

  def test_can_find_an_id_and_return_nil_or_a_matching_merchant
    merchant_one = Merchant.new({:id => "123456", :name => "blah", :creation_date => "05/13/1986"}, self)
    merchant_two = Merchant.new({:id => "123458", :name => "blah", :creation_date => "05/13/1986"}, self)

    merchant_repository = MerchantRepository.new([merchant_one, merchant_two])
    assert_equal nil, merchant_repository.find_by_id("123455")
    assert_equal merchant_one, merchant_repository.find_by_id("123456")
  end

  def test_can_find_a_name_and_return_nil_or_a_matching_merchant
    merchant_one = Merchant.new({:id => "123456", :name => "blah", :creation_date => "05/13/1986"}, self)
    merchant_two = Merchant.new({:id => "123458", :name => "Bloop", :creation_date => "05/13/1986"}, self)

    merchant_repository = MerchantRepository.new([merchant_one, merchant_two])
    assert_equal nil, merchant_repository.find_by_name("bleh")
    assert_equal merchant_two, merchant_repository.find_by_name("Bloop")
  end

  def test_it_returns_empty_array_or_matches_of_name_fragment
      merchant_one = Merchant.new({:id => "123456", :name => "blah", :creation_date => "05/13/1986"}, self)
      merchant_two = Merchant.new({:id => "123458", :name => "blah", :creation_date => "05/13/1986"}, self)

      merchant_repository = MerchantRepository.new([merchant_one, merchant_two])
      assert_equal , merchant_repository.find_all_by_name("blah")
      assert_equal [], merchant_repository.find_all_by_name("cat")

  end



end
