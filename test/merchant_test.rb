require './test/test_helper'
require './lib/merchant'

class TestMerchant < Minitest::Test
  def test_merchant_exists
    assert_instance_of Merchant, Merchant.new("test", self)
  end

  def test_it_has_a_id
    merchant = Merchant.new(["12334105", "Shopin1901", "2010-12-10", "2011-12-04"], self)
    id = "12334105"

    assert_equal id, merchant.id
  end

  def test_it_has_a_name
    merchant = Merchant.new(["12334105", "Shopin1901", "2010-12-10", "2011-12-04"], self)
    name = "Shopin1901"

    assert_equal name, merchant.name
  end

  def test_creation_date
    merchant = Merchant.new(["12334105", "Shopin1901", "2010-12-10", "2011-12-04"], self)
    creation = "2010-12-10"

    assert_equal creation, merchant.creation_date
  end

  def test_it_has_an_updated_date
    merchant = Merchant.new(["12334105", "Shopin1901", "2010-12-10", "2011-12-04"], self)
    update = "2011-12-04"

    assert_equal update, merchant.updated_date
  end

  def test_self_can_be_passed_into_merchant
    merchant = Merchant.new(["12334105", "Shopin1901", "2010-12-10", "2011-12-04"], self)


    assert_equal self, merchant.repo
  end
end
