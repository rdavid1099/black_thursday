require_relative '../lib/merchant'
require_relative '../lib/file_reader'
require 'csv'

class MerchantRepository
  include FileReader

  attr_reader  :all,
               :sales_engine

  def initialize(pathname, sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
    generate_from_file(pathname, self) if pathname[-4..-1] == ".csv"
  end

  def add_data(data)
    @all << Merchant.new(data, self)
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

  def pass_id(id, path)
    sales_engine.id_parser(id, path)
  end

  def inspect

  end
end
