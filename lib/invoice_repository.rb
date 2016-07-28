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
end
