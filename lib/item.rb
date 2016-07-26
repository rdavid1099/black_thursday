class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :creation_date,
              :last_updated,
              :repo

  def initialize(information, repo)
    @id = information[0]
    @name = information[1]
    @description = information[2]
    @unit_price = information[3]
    @merchant_id = information[4]
    @creation_date = information[5]
    @last_updated = information[6]
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end
end
