class Invoice
  attr_reader  :id,
               :customer_id,
               :merchant_id,
               :status,
               :created_at,
               :updated_at

    def initialize(information, repo)
      @id = information[:id].to_i
      @customer_id = information[:customer_id].to_i
      @merchant_id = information[:merchant_id].to_i
      @status = information[:status]
      @created_at = Time.parse(information[:created_at])
      @updated_at = Time.parse(information[:updated_at])
    end
 

end
