require './lib/item'

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
    CSV.open(pathname).read.each do |data|
      add_item(data)
    end
  end

  def find_by_id(requested_id)
    requested_id = requested_id.to_s unless requested_id.class == String
    all.find do |item|
      item.id == requested_id
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

end
