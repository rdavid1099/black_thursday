require './test/test_helper'
require './lib/transaction'

class TestTransaction < Minitest::Test

  def test_it_has_an_id
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    id = 1

    assert_equal id, transaction.id
  end

  def test_it_returns_the_invoice_id
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    iid = 2179

    assert_equal iid, transaction.invoice_id
  end

  def test_it_returns_the_credit_card_number
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    ccn = 4068631943231473

    assert_equal ccn, transaction.credit_card_number
  end

  def test_it_returns_the_credit_card_expiration_date
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    exp_date = "0217"

    assert_equal exp_date, transaction.credit_card_expiration_date
  end

  def test_it_returns_the_transaction_result
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    result = "success"
    assert_equal result, transaction.result
  end

  def test_creation_date
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    creation = Time.parse("2012-02-26 20:56:56 UTC")

    assert_equal creation, transaction.created_at
  end

  def test_updated_date
    transaction = Transaction.new({:id => "1", :invoice_id => "2179", :credit_card_number => "4068631943231473", :credit_card_expiration_date => "0217",:result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}, self)
    update = Time.parse("2012-02-26 20:56:56 UTC")

    assert_equal update, transaction.updated_at
  end

end
