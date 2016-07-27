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
    @creation_date = convert_time(information[:created_at])
    @last_updated = convert_time(information[:updated_at])
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end

  def convert_time(raw_time)
    split_time = raw_time.split(/[\s:-]/)
    split_time = split_time[0..split_time.length - 2].map do |digit|
      digit.to_i
    end
    Time.utc(split_time[0], split_time[1], split_time[2], split_time[3], split_time[4], split_time[5])
  end
end
