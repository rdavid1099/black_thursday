require './test/test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  def test_item_repository_exists
    ir = ItemRepository.new("test", self)

    assert_instance_of ItemRepository, ir
  end

  def test_item_repository_can_receive_filenames
    ir = ItemRepository.new("./data/items.csv", self)

    assert_equal  "./data/items.csv", ir.pathname
  end

  def test_repository_receives_self_from_other_classes
    ir = ItemRepository.new("test", self)

    assert_equal self, ir.sales_engine
  end

  def test_repository_adds_items
    ir = ItemRepository.new("test", self)
    ir.add_item()
  end

end
