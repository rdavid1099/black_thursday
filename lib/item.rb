require 'bigdecimal'

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
    @unit_price = BigDecimal.new(information[:unit_price],4)
    @merchant_id = information[:merchant_id]
    @creation_date = Time.parse(information[:created_at])
    @last_updated = Time.parse(information[:updated_at])
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end
end
