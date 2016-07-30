class InvoiceItemRepository

  attr_reader :all,
              :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
  end

  def add_data(data)
    @all << data
  end
end
