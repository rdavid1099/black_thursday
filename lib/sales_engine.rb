require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_repository'
require 'pry'
class SalesEngine

  def self.from_csv(pathnames)
    generate_repositories(pathnames)
    self
  end

  def self.generate_repositories(pathnames)
    activate_items_repo(pathnames[:items]) unless pathnames[:items].nil?
    activate_merchants_repo(pathnames[:merchants]) unless pathnames[:merchants].nil?
    activate_invoices_repo(pathnames[:invoices]) unless pathnames[:invoices].nil?
  end

  def self.activate_items_repo(pathname)
    @items = ItemRepository.new(pathname, self)
    @items.generate_from_file
  end

  def self.activate_merchants_repo(pathname)
    @merchants = MerchantRepository.new(pathname, self)
    @merchants.generate_from_file
  end

  def self.activate_invoices_repo(pathname)
    @invoices = InvoiceRepository.new(pathname, self)
    @invoices.generate_from_file
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
