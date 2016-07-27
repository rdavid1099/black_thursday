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
    @repo = repo
  end





end
