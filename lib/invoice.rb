class Invoice
  attr_reader  :id

    def initialize(information)
    @id = information[:id].to_i
    @customer_id = information[:customer_id]
  end


end
