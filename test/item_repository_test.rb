require './test/test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  def test_item_repository_exists
    ir = ItemRepository.new

    assert_instance_of ItemRepository, ir
  end

  def test_item_repository_can_load_from_files
    ir = ItemRepository.new

    assert_respond_to ir, :load_from_file
  end

  def test_item_repository_can_receive_filenames
    ir = ItemRepository.new

    assert ir.load_from_file('./data/test_items.csv')
  end

end
