require '../lib/invoice_item'

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

end
