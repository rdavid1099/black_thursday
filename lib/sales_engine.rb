require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/transaction_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/invoice_item_repository'

class SalesEngine

  def self.from_csv(pathnames)
    @items = ItemRepository.new(pathnames[:items], self)
    @merchants = MerchantRepository.new(pathnames[:merchants], self)
    @invoices = InvoiceRepository.new(pathnames[:invoices], self)
    @transactions = TransactionRepository.new(pathnames[:transactions], self)
    @customers = CustomerRepository.new(pathnames[:customers], self)
    @invoice_items = InvoiceItemRepository.new(pathnames[:invoice_items], self)
    self
  end

  def self.items
    @items
  end

  def self.merchants
    @merchants
  end

  def self.invoices
    @invoices
  end

  def self.transactions
    @transactions
  end

  def self.customers
    @customers
  end

  def self.invoice_items
    @invoice_items
  end

  def self.id_parser(id, path)
    return merchant_searching(id, path[:destination]) if path[:type] == "merchant"
    return item_searching(id, path[:destination]) if path[:type] == "item"
    return invoice_searching(id, path[:destination]) if path[:type] == "invoice"
    return transaction_searching(id, path[:destination]) if path[:type] == "transaction"
    return customer_searching(id, path[:destination]) if path[:type] == "customer"
  end

  def self.merchant_searching(id, search_type)
    return @items.find_all_by_merchant_id(id) if search_type == "items"
    return @invoices.find_all_by_merchant_id(id) if search_type == "invoices"
    return link_merchants_to_customers(id) if search_type == "customers"
  end

  def self.item_searching(id, search_type)
    return @merchants.find_by_id(id) if search_type == "merchants"
  end

  def self.invoice_searching(id, search_type)
    return @merchants.find_by_id(id) if search_type == "merchants"
    return items_linked_to_invoice(id) if search_type == "items"
    return @transactions.find_all_by_invoice_id(id) if search_type == "transactions"
    return @customers.find_by_id(id) if search_type == "customer"
    return find_payment_status(id) if search_type == "paid_in_full"
    return total_payment(id) if search_type == "total"
  end

  def self.transaction_searching(id, search_type)
    return @invoices.find_by_id(id) if search_type == "invoice"
  end

  def self.customer_searching(id, search_type)
    return link_customers_to_merchants(id) if search_type == "merchants"
  end

  def self.link_merchants_to_customers(merch_id)
    @invoices.find_all_by_merchant_id(merch_id).map do |invoice|
      @customers.find_by_id(invoice.customer_id)
    end.uniq
  end

  def self.link_customers_to_merchants(customer_id)
    @invoices.find_all_by_customer_id(customer_id).map do |invoice|
      @merchants.find_by_id(invoice.merchant_id)
    end.uniq
  end

  def self.items_linked_to_invoice(invoice_id)
    @invoice_items.find_all_by_invoice_id(invoice_id).map do |invoice_item|
      @items.find_by_id(invoice_item.item_id)
    end
  end

  def self.find_payment_status(invoice_id)
    @transactions.find_all_by_invoice_id(invoice_id).any? do |transaction|
      transaction.result == "success"
    end
  end

  def self.total_payment(invoice_id)
    total_invoices = @invoice_items.find_all_by_invoice_id(invoice_id)
    total_invoices.reduce(0) do |result, invoice_item|
      if find_payment_status(invoice_item.invoice_id)
        result += invoice_item.unit_price * invoice_item.quantity
      end
      result
    end
  end
end
