require_relative '../lib/invoice_item'

class InvoiceItemRepository

  attr_reader :sales_engine,
              :all

  def initialize(information, sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
  end

  def add_data(data)
    @all << InvoiceItem.new(data, self)
  end

  def find_by_id(requested_id)
    all.find do |item|
      item.id.to_s == requested_id.to_s
    end
  end

  def find_all_by_item_id(requested_id)
    all.find_all do |item|
      item.item_id.to_s.include?(requested_id.to_s)
    end
  end

  def find_all_by_invoice_id(requested_id)
    all.find_all do |item|
      item.invoice_id.to_s.include?(requested_id.to_s)
    end
  end

end