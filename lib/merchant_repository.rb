require_relative 'merchant'

class MerchantRepository
    attr_reader  :merchants

  def initialize(merchants = [])
    @merchants = merchants
  end

  def all
    @merchants
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      id == merchant.id
    end
  end

  def find_by_name(name)
    @merchants.find do |merchant|
      name.downcase == merchant.name.downcase
    end
  end

  def find_all_by_name(search)
    @merchants.find_all { |character| name.include?(character)}
  end




end
