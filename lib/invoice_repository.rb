class InvoiceRepository

  attr_reader :invoices

  def initialize(invoices=[])
    @invoices = invoices
  end

  def all
    invoices
  end

  def find_by_id(id)
  end
end
