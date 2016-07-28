require 'csv'

class InvoiceRepository

  attr_reader :pathname,
              :sales_engine,
              :all

  def initialize(pathname,sales_engine)
    @pathname = pathname
    @sales_engine = sales_engine
    @all = []
  end

  def add_invoice(data)
    all << Invoice.new(data, self)
  end

  def generate_from_file
    contents = CSV.open pathname, headers: true, header_converters: :symbol
    contents.each do |content|
      add_invoice(content)
    end
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

end
