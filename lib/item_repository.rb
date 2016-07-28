require_relative '../lib/item'
require 'csv'

class ItemRepository
  attr_reader :pathname,
              :sales_engine,
              :all

  def initialize(pathname, sales_engine)
    @pathname = pathname
    @sales_engine = sales_engine
    @all = Array.new
  end

  def add_item(data)
    @all << Item.new(data, self)
  end

  def generate_from_file
    contents = CSV.open pathname, headers: true, header_converters: :symbol
    contents.each do |content|
      add_item(content)
    end
  end

  def find_by_id(requested_id)
    all.find do |item|
      item.id.to_s == requested_id.to_s
    end
  end

  def find_by_name(requested_name)
    all.find do |item|
      item.name.downcase == requested_name.downcase
    end
  end

  def find_all_with_description(word_search)
    all.find_all do |item|
      item.description.downcase.include?(word_search.downcase)
    end
  end

  def find_all_by_price(price)
    all.find_all do |item|
      item.unit_price_to_dollars == price.to_f
    end
  end

  def find_all_by_price_in_range(range)
    all.find_all do |item|
      range.include?(item.unit_price_to_dollars.to_f)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    all.find_all do |item|
      item.merchant_id.to_s == merchant_id.to_s
    end
  end

  def pass_id(id, path)
    sales_engine.id_parser(id, path)
  end

  def inspect

  end
end
