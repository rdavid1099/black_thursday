require './test/test_helper'
require './lib/merchant_repository'
require './lib/sales_engine'
class TestMerchantRepository < Minitest::Test
  def test_can_return_array_of_all_known_merchant_instances
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    merchant_two = {:id => "123456", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)

    assert_equal 2, mr.all.count
  end

  def test_can_find_an_id_and_return_nil_or_a_matching_merchant
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "12345324", :name => "BObbY", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    merchant_two = {:id => "123456", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)

    assert_equal mr.all[1], mr.find_by_id("123456")
    assert_equal nil, mr.find_by_id("1234352")
  end

  def test_can_find_a_name_and_return_nil_or_a_matching_merchant
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    merchant_two = {:id => "123458", :name => "Bloop", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}

    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)
    assert_equal nil, mr.find_by_name("bleh")
    assert_equal 123458, mr.find_by_name("Bloop").id
  end

  def test_it_returns_empty_array_or_matches_of_name_fragment
    mr = MerchantRepository.new("test", self)
    merchant_one = {:id => "123456", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    merchant_two = {:id => "123458", :name => "blah", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}
    merchant_three = {:id => "123458", :name => "FRANK", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "2016-01-11 11:46:07 UTC"}

    mr.add_merchant(merchant_one)
    mr.add_merchant(merchant_two)
    mr.add_merchant(merchant_three)
    assert_equal 123456, mr.find_all_by_name("bla")[0].id
    assert_equal [], mr.find_all_by_name("cat")
  end

  def test_merchant_repo_reads_from_csv
    mr = MerchantRepository.new("./data/test_merchants.csv", self)
    mr.generate_from_file

    assert_equal true, mr.all.length > 20
  end

  def test_merch_repo_finds_by_id_with_csv
    mr = MerchantRepository.new("./data/test_merchants.csv", self)
    mr.generate_from_file

    assert_equal "MaidichaToos", mr.find_by_id("12334454").name
    assert_equal "EllGe", mr.find_by_id("12334542").name
    assert_equal nil, mr.find_by_id("99999999999")
  end

  def test_merch_repo_finds_by_name_with_csv
    mr = MerchantRepository.new("./data/test_merchants.csv", self)
    mr.generate_from_file

    assert_equal 12334454, mr.find_by_name("MaidichaToos").id
    assert_equal 12334542, mr.find_by_name("EllGe").id
    assert_equal nil, mr.find_by_name("Eric Cartman")
  end

  def test_merch_repo_can_find_all_by_name_from_csv
    mr = MerchantRepository.new("./data/test_merchants.csv", self)
    mr.generate_from_file

    assert_equal true, mr.find_all_by_name("a").length > 10
    assert_equal 0, mr.find_all_by_name("zxy").length
    assert_equal 1, mr.find_all_by_name("poop").length
  end
end
