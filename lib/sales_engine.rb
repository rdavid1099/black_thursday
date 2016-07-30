require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'

class SalesEngine

  def self.from_csv(pathnames)
    @items = ItemRepository.new(pathnames[:items], self)
    @merchants = MerchantRepository.new(pathnames[:merchants], self)
    @invoices = InvoiceRepository.new(pathnames[:invoices], self)
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

  def self.id_parser(id, path)
    return merchant_searching(id, path[:destination]) if path[:type] == "merchant"
    return item_searching(id, path[:destination]) if path[:type] == "item"
    return invoice_searching(id, path[:destination]) if path[:type] == "invoice"
  end

  def self.merchant_searching(id, search_type)
    return @items.find_all_by_merchant_id(id) if search_type == "items"
    return @invoices.find_all_by_merchant_id(id) if search_type == "invoices"
  end

  def self.item_searching(id, search_type)
    return @merchants.find_by_id(id) if search_type == "merchants"
  end

  def self.invoice_searching(id, search_type)
    return @merchants.find_by_id(id) if search_type == "merchants"
  end
end
