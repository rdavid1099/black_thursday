require './test/test_helper'
require './lib/item'

class TestItems < Minitest::Test
  def test_items_exist
    assert_instance_of Item, Item.new("test", self)
  end

  def test_items_have_id
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    id = "263399749"

    assert_equal id, item.id
  end

  def test_items_have_name
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    name = "Grande toile"

    assert_equal name, item.name
  end

  def test_items_have_a_description
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    description = "Acrylique sur toile, mesurant environs 80/50cm."

    assert_equal description, item.description
  end

  def test_item_knows_unit_price
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    price = "5000"

    assert_equal price, item.unit_price
  end

  def test_item_knows_merchant_id
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    merchant_id = "12334395"

    assert_equal merchant_id, item.merchant_id
  end

  def test_item_knows_creation_date_and_time
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    creation = "2016-01-11 11:46:07 UTC"

    assert_equal creation, item.creation_date
  end

  def test_item_knows_last_updated_date
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    last_updated = "1999-09-10 14:00:52 UTC"

    assert_equal last_updated, item.last_updated
  end

  def test_item_converts_price_to_dollars
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)
    converted_to_dollars = 5000.00

    assert_equal converted_to_dollars, item.unit_price_to_dollars
  end

  def test_self_can_be_passed_into_items
    item = Item.new(["263399749", "Grande toile", "Acrylique sur toile, mesurant environs 80/50cm.", "5000", "12334395", "2016-01-11 11:46:07 UTC", "1999-09-10 14:00:52 UTC"], self)

    assert_equal self, item.repo
  end

end
