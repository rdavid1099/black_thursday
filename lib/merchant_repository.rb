require_relative '../lib/merchant'
require 'csv'

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

  def generate_from_file
    contents = CSV.open pathname, headers: true, header_converters: :symbol
    contents.each do |content|
      add_merchant(content)
    end
  end

  def find_by_id(id)
    all.find do |merchant|
      id.to_s == merchant.id.to_s
    end
  end

  def find_by_name(name)
    all.find do |merchant|
      name.downcase == merchant.name.downcase
    end
  end

  def find_all_by_name(search)
    all.find_all do |merchant|
      merchant.name.downcase.include?(search.downcase)
    end
  end

  def pass_id(id)
    sales_engine.find_items(id)
  end

  def inspect

  end
end
