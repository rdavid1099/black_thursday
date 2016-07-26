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
    @id = information[:id]
    @name = information[:name]
    @description = information[:description]
    @unit_price = information[:price]
    @merchant_id = information[:merchant_id]
    @creation_date = information[:creation_date]
    @last_updated = information[:last_updated]
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end
end
