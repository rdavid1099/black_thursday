require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require 'pry'
class SalesEngine

  def self.from_csv(pathnames)
    @items = ItemRepository.new(pathnames[:items], self)
    @items.generate_from_file
    @merchants = MerchantRepository.new(pathnames[:merchants], self)
    @merchants.generate_from_file
    self
  end

  def self.items
    @items
  end

  def self.merchants
    @merchants
  end

  def self.find_items(id)
    @items.find_all_by_merchant_id(id)
  end

  def self.find_merchant(id)
    @merchants.find_by_id(id)
  end
end
