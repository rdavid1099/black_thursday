class Transaction
attr_reader :id,
            :invoice_id,
            :credit_card_number,
            :credit_card_expiration_date,
            :result,
            :created_at,
            :updated_at

  def initialize(information, repo)
    @id = information[:id].to_i
    @invoice_id = information[:invoice_id].to_i
    @credit_card_number = information[:credit_card_number]
    @credit_card_expiration_date = information[:credit_card_expiration_date]
    @result = information[:result]
    @created_at = Time.parse(information[:created_at])
    @updated_at = Time.parse(information[:updated_at])
  end


end
