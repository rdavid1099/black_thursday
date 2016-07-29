class InvoiceItem

  attr_reader  :id,
               :item_id,
               :invoice_id,
               :quantity,
               :unit_price,
               :created_at,
               :updated_at

  def initialize (information, repo)
    @id = information[:id].to_i
    @item_id = information[:item_id]
    @invoice_id = information[:invoice_id]
    @quantity = information[:quantity]
    @unit_price = information[:unit_price]
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
  end



end
