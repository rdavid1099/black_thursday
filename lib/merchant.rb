class Merchant
  attr_reader :id,
              :name,
              :creation_date,
              :updated_date

  def initialize(information)
    @id = information[0]
    @name = information[1]
    @creation_date = information[2]
    @updated_date = information[3]
  end


end
