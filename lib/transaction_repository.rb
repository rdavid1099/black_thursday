require_relative "../lib/transaction"
class TransactionRepository

  attr_reader :all

  def initialize(pathname, sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
  end

  def add_data(data)
    all << Transaction.new(data, self)
  end

  def find_by_id(id)
    all.find do |transaction|
      id.to_s == transaction.id.to_s
    end
  end

  def find_all_by_invoice_id(input)
    all.find_all do |transaction|
      transaction.invoice_id.to_s.include?(input.to_s) 
    end
  end

end
