require './test/test_helper'
require './lib/item'

class TestItems < Minitest::Test

  def test_items_have_id
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    id = "263399749"

    assert_equal id, item.id
  end

  def test_items_have_name
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    name = "Grande toile"

    assert_equal name, item.name
  end

  def test_items_have_a_description
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    description = "Acrylique sur toile, mesurant environs 80/50cm."

    assert_equal description, item.description
  end

  def test_item_knows_unit_price
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
    price = "5000"
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608

    assert_instance_of BigDecimal, item.unit_price
  end

  def test_item_knows_merchant_id
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    merchant_id = "12334395"

    assert_equal merchant_id, item.merchant_id
  end

  def test_item_knows_creation_date_and_time
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    creation = Time.utc(2016, 01, 11, 11, 46, 07)

    assert_equal creation, item.creation_date
  end

  def test_item_knows_last_updated_date
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    last_updated = Time.utc(1999, 9, 10, 14, 00, 52)

    assert_equal last_updated, item.last_updated
  end

  def test_item_converts_price_to_dollars
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608
    converted_to_dollars = 5000.00

    assert_equal converted_to_dollars, item.unit_price_to_dollars
  end

  def test_self_can_be_passed_into_items
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608

    assert_equal self, item.repo
  end

  def test_item_converts_string_to_time
<<<<<<< HEAD
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"}, self)
=======
    item = Item.new({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"}, self)
>>>>>>> 67ca5571b2c8a0faa0d4d1005a4152f167b3f608

    assert_equal Time.utc(2016, 01, 11, 11, 46, 07), item.convert_time("2016-01-11 11:46:07 UTC")
  end
end
