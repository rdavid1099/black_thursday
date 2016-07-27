require_relative '../lib/merchant'

class MerchantRepository
    attr_reader  :all,
                 :sales_engine,
                 :pathname

  def initialize(pathname, sales_engine)
    @all = Array.new
    @sales_engine = sales_engine
    @pathname = pathname
  end

  def add_merchant(data)
    @all << Merchant.new(data, self)
  end

  def find_by_id(id)
    all.find do |merchant|
      id == merchant.id
    end
  end

  def find_by_name(name)
    all.find do |merchant|
      name.downcase == merchant.name.downcase
    end
  end

  def find_all_by_name(search)
    all.find_all do |merchant|
      merchant.name.include?(search)
    end
  end
end
