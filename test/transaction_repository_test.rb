require './test/test_helper'
require './lib/transaction_repository'
require './lib/sales_engine'

class TestTransactionRepository < Minitest::Test
  def test_can_return_array_of_all_known_transaction_instances
    tr = TransactionRepository.new("test", self)
    trans_one = {:id => 3,:invoice_id => 750, :credit_card_number => "4271805778010747", :credit_card_expiration_date => "1220", :result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}
    trans_two = {:id => 12, :invoice_id => 419,:credit_card_number => "4625296309157421", :credit_card_expiration_date => "0614", :result => "success", :created_at => "2012-02-26 20:56:57 UTC", :updated_at => "2012-02-26 20:56:57 UTC"}
    tr.add_data(trans_one)
    tr.add_data(trans_two)

    assert_equal 2, tr.all.count
  end

  def test_can_find_by_id_and_return_nil_or_a_matching_transaction_instance
    tr = TransactionRepository.new("test", self)
    trans_one = {:id => 3,:invoice_id => 750, :credit_card_number => "4271805778010747", :credit_card_expiration_date => "1220", :result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}
    trans_two = {:id => 12, :invoice_id => 419,:credit_card_number => "4625296309157421", :credit_card_expiration_date => "0614", :result => "success", :created_at => "2012-02-26 20:56:57 UTC", :updated_at => "2012-02-26 20:56:57 UTC"}
    tr.add_data(trans_one)
    tr.add_data(trans_two)

    assert_equal tr.all[0], tr.find_by_id(3)
    assert_equal nil, tr.find_by_id(111)
  end


  def test_it_returns_empty_array_or_matches_with_matching_invoice_id
    tr = TransactionRepository.new("test", self)
    trans_one = {:id => 3,:invoice_id => 750, :credit_card_number => "4271805778010747", :credit_card_expiration_date => "1220", :result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}
    trans_two = {:id => 12, :invoice_id => 419,:credit_card_number => "4625296309157421", :credit_card_expiration_date => "0614", :result => "success", :created_at => "2012-02-26 20:56:57 UTC", :updated_at => "2012-02-26 20:56:57 UTC"}
    tr.add_data(trans_one)
    tr.add_data(trans_two)

    assert_equal 3, tr.find_all_by_invoice_id(750)[0].id
    assert_equal 12, tr.find_all_by_invoice_id(419)[0].id
  end

  def test_it_finds_transactions_by_credit_card_number
    tr = TransactionRepository.new("test", self)
    trans_one = {:id => 3,:invoice_id => 750, :credit_card_number => "4271805778010747", :credit_card_expiration_date => "1220", :result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}
    trans_two = {:id => 12, :invoice_id => 419,:credit_card_number => "4625296309157421", :credit_card_expiration_date => "0614", :result => "success", :created_at => "2012-02-26 20:56:57 UTC", :updated_at => "2012-02-26 20:56:57 UTC"}
    tr.add_data(trans_one)
    tr.add_data(trans_two)
    number = "4271805778010747"

    assert_equal 3, tr.find_all_by_credit_card_number(number)[0].id
    assert_equal 750, tr.find_all_by_credit_card_number(number.to_i)[0].invoice_id
  end

  def test_it_finds_all_transactions_with_given_result
    tr = TransactionRepository.new("test", self)
    trans_one = {:id => 3,:invoice_id => 750, :credit_card_number => "4271805778010747", :credit_card_expiration_date => "1220", :result => "success", :created_at => "2012-02-26 20:56:56 UTC", :updated_at => "2012-02-26 20:56:56 UTC"}
    trans_two = {:id => 12, :invoice_id => 419,:credit_card_number => "4625296309157421", :credit_card_expiration_date => "0614", :result => "success", :created_at => "2012-02-26 20:56:57 UTC", :updated_at => "2012-02-26 20:56:57 UTC"}
    tr.add_data(trans_one)
    tr.add_data(trans_two)

    assert_equal 0, tr.find_all_by_result("failed").length
    assert_equal 2, tr.find_all_by_result("success").length
  end

  def test_it_can_read_from_csv_files
    tr = TransactionRepository.new("./data/test_transactions.csv", self)

    assert_equal 20, tr.all.length
  end

  def test_it_can_find_data_loaded_from_csv
    tr = TransactionRepository.new("./data/test_transactions.csv", self)

    assert_equal tr.all[0], tr.find_by_id(1)
    assert_equal nil, tr.find_by_id(111)
  end

  def test_it_can_find_all_by_invoice_id_from_csv
    tr = TransactionRepository.new("./data/test_transactions.csv", self)

    assert_equal 3, tr.find_all_by_invoice_id(1).length
    assert_equal [], tr.find_all_by_invoice_id(419)
  end

  def test_it_can_find_all_credit_card_numbers_loaded_from_csv
    tr = TransactionRepository.new("./data/test_transactions.csv", self)

    assert_equal 1, tr.find_all_by_credit_card_number(4068631943231473)[0].id
  end

  def test_it_finds_all_by_result_using_data_from_csv
    tr = TransactionRepository.new("./data/test_transactions.csv", self)

    assert_equal 4, tr.find_all_by_result("failed").length
    assert_equal 16, tr.find_all_by_result("success").length
    assert_equal 0, tr.find_all_by_result("pending").length
  end
end
