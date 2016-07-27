require './test/test_helper'
require './lib/merchant'

class TestMerchant < Minitest::Test

  def test_it_has_a_id
    merchant = Merchant.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"}, self)
    id = 12334105

    assert_equal id, merchant.id
  end

  def test_it_has_a_name
    merchant = Merchant.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"}, self)
    name = "Shopin1901"

    assert_equal name, merchant.name
  end

  def test_creation_date
    merchant = Merchant.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"}, self)
    creation = Time.parse("2010-12-10")

    assert_equal creation, merchant.created_at
  end

  def test_it_has_an_updated_date
    merchant = Merchant.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"}, self)
    update = Time.parse("2011-12-04")

    assert_equal update, merchant.updated_at
  end

  def test_self_can_be_passed_into_merchant
    merchant = Merchant.new({:id => "12334105", :name => "Shopin1901", :created_at => "2010-12-10", :updated_at => "2011-12-04"}, self)

    assert_equal self, merchant.repo
  end
end
