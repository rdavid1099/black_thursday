require './test/test_helper'
require './lib/sales_engine'

class TestSalesEngine < Minitest::Test
  def test_sales_engine_exists
    assert_instance_of SalesEngine, SalesEngine.new
  end

  def test_hash_of_pathnames_can_be_passed_into_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})

    assert_instance_of ItemRepository, se.items
    assert_instance_of MerchantRepository, se.merchants
  end

  def test_instance_of_merchants_can_be_assigned_to_a_variable
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants

    assert_instance_of MerchantRepository, mr
  end

  def test_merchants_can_find_by_name_from_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants
    merchant = mr.find_by_name("Mr. Test")
    no_merchant = mr.find_by_name("NOT A NAME")

    assert_equal "Mr. Test", merchant.name
    assert_equal nil, no_merchant
  end

  def test_instance_of_item_repository_can_be_saved_to_variable
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    ir = se.items

    assert_instance_of ItemRepository, ir
  end

  def test_items_can_find_by_name_from_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    ir = se.items
    item = ir.find_by_name("Test Item")

    assert_equal 50, item.id
    assert_instance_of Item, item
  end

  def test_it_can_find_a_merchant_by_given_id_from_sales_engine
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants
    merchant = mr.find_by_id(15)

    assert_equal 15, merchant.id
  end

  def test_it_can_use_data_in_item_class
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    mr = se.merchants
    merchant = se.merchants.find_by_id(10)

    assert_instance_of Array, merchant.items
    assert_equal 10, merchant.items[0].merchant_id
  end

  def test_it_can_use_item_data_in_merchant_class
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv"})
    item = se.items.find_by_id(55)

    assert_equal "Mr. Test", item.merchant.name
  end

  def test_instance_of_invoice_can_be_assigned_to_a_variable
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv"})
    inv = se.invoices

    assert_instance_of InvoiceRepository, inv
  end

  def test_merchant_returns_array_of_related_invoices
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv"})
    mr = se.merchants
    merchant = se.merchants.find_by_id(10)

    assert_instance_of Array, merchant.invoices
  end

  def test_invoice_returns_array_of_related_merchants
    se = SalesEngine.from_csv({:items => "./data/test_items.csv", :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv"})
    inv = se.invoices.find_by_id(5)

    assert_equal "Mr. Test", inv.merchant.name
  end

  def test_engine_loads_transaction_repo
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv"})

    assert_equal 20, se.transactions.all.length
  end

  def test_engine_loads_customer_repo
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})

    assert_equal 20, se.customers.all.length
  end

  def test_engine_links_invoices_to_others
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    invoice = se.invoices.find_by_id(10)

    assert_instance_of Array, invoice.items
    assert_instance_of Array, invoice.transactions
    assert_instance_of Customer, invoice.customer
  end

  def test_engine_links_transactions_to_others
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    transaction = se.transactions.find_by_id(10)

    assert_instance_of Invoice, transaction.invoice
  end

  def test_engine_links_merchants_to_customers
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    merchant = se.merchants.find_by_id(10)

    assert_instance_of Array, merchant.customers
    assert_instance_of Customer, merchant.customers[0]
  end

  def test_engine_links_customers_to_merchants
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    customer = se.customers.find_by_id(12)

    assert_instance_of Array, customer.merchants
    assert_instance_of Merchant, customer.merchants[0]
  end

  def test_invoice_returns_true_or_false_regarding_payment
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    invoice = se.invoices.find_by_id(10)

    assert_equal true, invoice.is_paid_in_full?
  end

  def test_engine_calculates_total_amount_of_the_invoice
    se = SalesEngine.from_csv({:items => "./data/test_items.csv",
      :merchants => "./data/test_merchants.csv", :invoices => "./data/test_invoices.csv",
      :transactions => "./data/test_transactions.csv", :customers => "./data/test_customers.csv"})
    invoice = se.invoices.find_by_id(10)

    assert_instance_of BigDecimal, invoice.total
  end
end

# invoice.total returns the total $ amount of the invoice
