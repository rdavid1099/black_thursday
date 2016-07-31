require './test/test_helper'
require './lib/invoice_item'


class InvoiceItemTest < Minitest::Test

  def test_it_returns_the_integer_id
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)
    id = 1

    assert_equal id, ii.id
  end

  def test_it_returns_the_item_id
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)

<<<<<<< HEAD
    assert_equal 263519844, ii.item_id
=======
    assert_equal "263519844", ii.item_id
>>>>>>> e6999bec21770bc327dd14d26f2c7ad36570c611
  end

  def test_it_returns_the_invoice_id
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)

<<<<<<< HEAD
    assert_equal 1, ii.invoice_id
=======
    assert_equal "1", ii.invoice_id
>>>>>>> e6999bec21770bc327dd14d26f2c7ad36570c611
  end

  def test_it_returns_the_quantity
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)

<<<<<<< HEAD
    assert_equal 5, ii.quantity
=======
    assert_equal "5", ii.quantity
>>>>>>> e6999bec21770bc327dd14d26f2c7ad36570c611
  end

  def test_it_returns_the_unit_price
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)

<<<<<<< HEAD
    assert_instance_of BigDecimal, ii.unit_price
=======
    assert_equal "13635", ii.unit_price
>>>>>>> e6999bec21770bc327dd14d26f2c7ad36570c611
  end

  def test_it_returns_time_instance_for_invoice_creation_date
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)
    creation = Time.parse("2012-03-27")

    assert_equal creation, ii.created_at
  end

  def test_it_returns_the_time_instance_for_the_invoice_last_modified_date
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)
    updated = Time.parse("2012-03-27")

    assert_equal updated, ii.updated_at
  end

  def test_item_converts_price_to_dollars_as_float
    ii = InvoiceItem.new({:id =>"1",:item_id => "263519844",:invoice_id => "1",:quantity => "5",:unit_price => "13635",:created_at => "2012-03-27",:updated_at => "2012-03-27"}, self)
    converted_to_dollars = 136.35

    assert_equal converted_to_dollars, ii.unit_price_to_dollars
  end


end
