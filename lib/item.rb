require 'bigdecimal'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repo

  def initialize(information, repo)
    @id = information[:id].to_i
    @name = information[:name]
    @description = information[:description]
    @unit_price = BigDecimal.new(information[:unit_price], 4)/100
    @merchant_id = information[:merchant_id].to_i
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
    @path = {:type => "item"}
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end

  def merchant
    @path[:destination] = "merchants"
    repo.pass_id(merchant_id, @path)
  end


end
