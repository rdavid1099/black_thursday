require 'bigdecimal'

class InvoiceItem
  attr_reader  :id,
               :item_id,
               :invoice_id,
               :quantity,
               :unit_price,
               :created_at,
               :updated_at,
               :unit_price,
               :repo


  def initialize (information, repo)
    @id = information[:id].to_i
    @item_id = information[:item_id]
    @invoice_id = information[:invoice_id]
    @quantity = information[:quantity]
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
    @unit_price = BigDecimal.new(information[:unit_price], 4)
    @repo = repo
  end

  def unit_price_to_dollars
    unit_price.to_f
  end


end