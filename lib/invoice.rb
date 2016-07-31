class Invoice
  attr_reader  :id,
               :customer_id,
               :merchant_id,
               :status,
               :created_at,
               :updated_at,
               :repo

  def initialize(information, repo)
    @id = information[:id].to_i
    @customer_id = information[:customer_id].to_i
    @merchant_id = information[:merchant_id].to_i
    @status = generate_status(information[:status])
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
    @path = {:type => "invoice"}
    @repo = repo
  end

  def generate_status(status)
    return :shipped if status == "shipped"
    return :pending if status == "pending"
    return :returned if status == "returned"
  end

  def merchant
    @path[:destination] = "merchants"
    repo.pass_id(merchant_id, @path)
  end

  def items
    @path[:destination] = "items"
    repo.pass_id(merchant_id, @path)
  end

  def transactions
    @path[:destination] = "transactions"
    repo.pass_id(id, @path)
  end

  def customer
    @path[:destination] = "customer"
    repo.pass_id(customer_id, @path)
  end

end
