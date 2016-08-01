class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  def initialize(information, repo)
    @id = information[:id].to_i
    @name = information[:name]
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
    @path = {:type => "merchant"}
    @repo = repo
  end

  def items
    @path[:destination] = "items"
    repo.pass_id(id, @path)
  end

  def invoices
    @path[:destination] = "invoices"
    repo.pass_id(id, @path)
  end

  def customers
    @path[:destination] = "customers"
    repo.pass_id(id, @path)
  end
end
