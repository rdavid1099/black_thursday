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

    assert_equal 750, tr.find_all_by_invoice_id(3)[0].id
    # assert_equal [], tr.find_all_by_invoice_id(000)
  end





end
