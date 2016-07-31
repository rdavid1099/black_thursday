require_relative '../lib/customer'
require_relative '../lib/file_reader'


class CustomerRepository
  include FileReader

  attr_reader   :all,
                :sales_engine

  def initialize(pathname, sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
    generate_from_file(pathname, self) if pathname.to_s[-4..-1] == ".csv"
  end

  def add_data(data)
    all << Customer.new(data,self)
  end

  def find_by_id(id)
    all.find do |customer|
      id.to_s == customer.id.to_s
    end
  end

  def find_all_by_first_name(search)
    all.find_all do |customer|
      customer.first_name.to_s.include? search
    end
  end

  def find_all_by_last_name(search)
    all.find_all do |customer|
      customer.last_name.to_s.include? search
    end
  end

  def pass_id(id, path)
    sales_engine.id_parser(id, path)
  end

end
