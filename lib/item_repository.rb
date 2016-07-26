class ItemRepository
  attr_reader :pathname,
              :sales_engine

  def initialize(pathname, sales_engine)
    @pathname = pathname
    @sales_engine = sales_engine
  end

end
