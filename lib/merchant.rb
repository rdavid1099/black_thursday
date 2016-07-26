class Merchant
  attr_reader :id,
              :name,
              :creation_date,
              :updated_date,
              :repo

  def initialize(information, repo)
    @id = information[:id]
    @name = information[:name]
    @creation_date = information[:creation_date]
    @updated_date = information[:updated_date]
    @repo = repo
  end




end
