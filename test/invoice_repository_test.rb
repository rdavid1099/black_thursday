require './test/test_helper'
require './lib/invoice_repository'
require './lib/invoice'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_exists
    ir = InvoiceRepository.new
    assert_instance_of InvoiceRepository, ir
  end

  def test_it_can_return_an_empty_array_when_there_are_no_known_invoices
    ir = InvoiceRepository.new
    assert_equal [], ir.all
  end

  def test_it_can_return_an_array_of_all_known_invoice_instances
    invoices = [Invoice.new, Invoice.new]
    ir       = InvoiceRepository.new(invoices)

    assert_equal 2, ir.all.count
    ir.all.each do |invoice|
      assert_instance_of Invoice, invoice
    end
  end

  def test_it_returns_nil_for_no_matching_id
    invoices = [Invoice.new, Invoice.new]
    ir       = InvoiceRepository.new(invoices)
    id       = "12345"

    assert_equal nil,ir.find_by_id(id)
  end

  def test_it_returns_an_instance_of_invoice_with_matching_id
    id       = "12345"
    invoices = [Invoice.new(id), Invoice.new]
    ir       = InvoiceRepository.new(invoices)

    assert_equal invoices.first, ir.find_by_id(id)
  end

  def test_it_returns_a_blank_array_for_customer_id
    ir       = InvoiceRepository.new(invoices)

  end

  def test_it_returns_one_or_more_matches_with_matching_customer_id

  end

  def test_it_returns_a_blank__merchant_array
  end

  def test_it_returns_one_or_more_matches_with_matching_merchant_id

  end

  def test_it_returns_an_empty_status_array
  end

  def test_it_returns_one_or_more_matches_with_matching_status
  end
end
