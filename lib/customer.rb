class Customer

attr_reader :id,
            :first_name,
            :last_name,
            :created_at,
            :updated_at,
            :repo

  def initialize(information, repo)
    @id = information[:id].to_i
    @first_name = information[:first_name].to_s
    @last_name = information[:last_name].to_s
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
    @path = {:type => "customer"}
    @repo = repo

  end

  def merchants
    @path[:destination] = "merchants"
    repo.pass_id(id, @path)
  end

end
