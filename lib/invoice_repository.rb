require_relative '../lib/invoice'
require_relative '../lib/file_reader'
require 'csv'

class InvoiceRepository
  include FileReader

  attr_reader :sales_engine,
              :all

  def initialize(pathname,sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
    generate_from_file(pathname, self) if pathname.to_s[-4..-1] == ".csv"
  end

  def add_data(data)
    all << Invoice.new(data, self)
  end

  def find_by_id(id)
    all.find do |invoice|
      id.to_s == invoice.id.to_s
    end
  end

  def find_all_by_customer_id(customer_id)
    all.find_all do |invoice|
      customer_id.to_s == invoice.customer_id.to_s
    end
  end

  def find_all_by_merchant_id(merchant_id)
    all.find_all do |invoice|
      merchant_id.to_s == invoice.merchant_id.to_s
    end
  end

  def find_all_by_status(status)
    all.find_all do |invoice|
      status == invoice.status
    end
  end

  def pass_id(id, path)
    sales_engine.id_parser(id, path)
  end

  def inspect

  end
end
