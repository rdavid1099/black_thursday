module SalesEngine

  def self.from_csv(pathname)
    @items = ItemRepository.new(pathname, )
  end

end
