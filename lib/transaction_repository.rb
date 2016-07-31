require_relative "../lib/transaction"
require_relative "../lib/file_reader"

class TransactionRepository
  include FileReader

  attr_reader :all,
              :sales_engine

  def initialize(pathname, sales_engine)
    @sales_engine = sales_engine
    @all = Array.new
    generate_from_file(pathname, self) if pathname.to_s[-4..-1] == ".csv"
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
      transaction.invoice_id.to_s == input.to_s
    end
  end

  def find_all_by_credit_card_number(number)
    all.find_all do |transaction|
      transaction.credit_card_number.to_s == number.to_s
    end
  end

  def find_all_by_result(status)
    all.find_all do |transaction|
      transaction.result == status
    end
  end

  def pass_id(id, path)
    sales_engine.id_parser(id, path)
  end

  def inspect
  end
end
