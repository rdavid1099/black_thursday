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
end
