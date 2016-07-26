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
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_instance_of Item, ir.all[0]
    assert_equal 1, ir.all.length
  end

  def test_item_repository_can_add_more_than_one_item
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.all.length
  end

  def test_repository_finds_elements_using_id
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grande toile", ir.find_by_id("263399749").name
  end

  def test_repository_returns_nil_if_id_is_incorrect
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal nil, ir.find_by_id("2633")
  end

  def test_repository_can_search_more_than_one_item_for_id
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})
    ir.add_item({:id => "263399748", :name => "Grand toilet", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})
    ir.add_item({:id => "263399747", :name => "Grande latte", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grand toilet", ir.find_by_id("263399748").name
    assert_equal "Grande latte", ir.find_by_id("263399747").name
  end

  def test_item_repository_can_find_ids_using_integers
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grande toile", ir.find_by_id(263399749).name
  end

  def test_item_repository_searches_using_names
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal "263399749", ir.find_by_name("Grande toile").id
  end

  def test_item_repository_name_search_is_not_case_sensitive
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal "263399749", ir.find_by_name("grande toile").id
    assert_equal "263399749", ir.find_by_name("gRaNdE ToIlE").id
  end

  def test_item_repository_returns_empty_array_if_description_doesnt_match_items
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal [], ir.find_all_with_description("blah")
  end

  def test_item_repo_finds_an_item_using_description
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("Acrylique sur toile, mesurant environs 80/50cm.").length
  end

  def test_item_repository_finds_items_with_just_a_few_words_from_description
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("sur toile").length
  end

  def test_search_by_description_is_not_case_sensitive
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique SUR TOile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("sUr ToIlE").length
  end

  def test_search_by_description_matches_all_items_matching_words_in_description
    ir = ItemRepository.new("test", self)
    ir.add_item({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})
    ir.add_item({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})
    ir.add_item({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :price => "5000", :merchant_id => "12334395", :creation_date => "2016-01-11 11:46:07 UTC", :last_updated => "1999-09-10 14:00:52 UTC"})

    assert_equal 3, ir.find_all_with_description("ENVIRONS").length
  end

end
