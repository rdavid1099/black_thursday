require './test/test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  def test_item_repository_exists
    ir = ItemRepository.new("test", self)

    assert_instance_of ItemRepository, ir
  end

  def test_repository_receives_self_from_other_classes
    ir = ItemRepository.new("test", self)

    assert_equal self, ir.sales_engine
  end

  def test_repository_adds_items
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_instance_of Item, ir.all[0]
    assert_equal 1, ir.all.length
  end

  def test_item_repository_can_add_more_than_one_item
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.all.length
  end

  def test_repository_finds_elements_using_id
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grande toile", ir.find_by_id(263399749).name
  end

  def test_repository_returns_nil_if_id_is_incorrect
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal nil, ir.find_by_id("2633")
  end

  def test_repository_can_search_more_than_one_item_for_id
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grand toilet", ir.find_by_id("263399748").name
    assert_equal "Grande latte", ir.find_by_id("263399747").name
  end

  def test_item_repository_can_find_ids_using_integers
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grande toile", ir.find_by_id(263399749).name
  end

  def test_item_repository_searches_using_names
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 263399749, ir.find_by_name("Grande toile").id
  end

  def test_item_repository_name_search_is_not_case_sensitive
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 263399749, ir.find_by_name("grande toile").id
    assert_equal 263399749, ir.find_by_name("gRaNdE ToIlE").id
  end

  def test_item_repository_returns_empty_array_if_description_doesnt_match_items
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal [], ir.find_all_with_description("blah")
  end

  def test_item_repo_finds_an_item_using_description
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("Acrylique sur toile, mesurant environs 80/50cm.").length
  end

  def test_item_repository_finds_items_with_just_a_few_words_from_description
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("sur toile").length
  end

  def test_search_by_description_is_not_case_sensitive
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique SUR TOile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_with_description("sUr ToIlE").length
  end

  def test_search_by_description_matches_all_items_matching_words_in_description
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 3, ir.find_all_with_description("ENVIRONS").length
  end

  def test_repository_searches_items_using_price
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal "Grande toile", ir.find_all_by_price("50.00")[0].name
  end

  def test_search_by_price_returns_empty_array_if_nothing_matches
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal [], ir.find_all_by_price("500")
  end

  def test_search_by_price_returns_all_matches
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "450", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.find_all_by_price("50.00").length
  end

  def test_search_by_price_can_take_integers
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 1, ir.find_all_by_price(50).length
  end

  def test_repo_returns_empty_array_if_price_range_doesnt_match
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "450", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5100", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal [], ir.find_all_by_price_in_range(Range.new(0,3))
  end

  def test_repo_finds_all_items_within_price_range
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "450", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5100", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.find_all_by_price_in_range(Range.new(50.00,55.00)).length
  end

  def test_repo_returns_empty_array_if_merchant_id_doesnt_exist
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal [], ir.find_all_by_merchant_id("2")
  end

  def test_repo_returns_items_matching_merchant_id
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "450", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5100", :merchant_id => "12334397", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.find_all_by_merchant_id("12334395").length
  end

  def test_repo_returns_items_matching_merchant_id_integer
    ir = ItemRepository.new("test", self)
    ir.add_data({:id => "263399749", :name => "Grande toile", :description => "Acrylique sur toile, mesurant environs 80/50cm.", :unit_price => "5000", :merchant_id => "12334395", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399748", :name => "Grand toilet", :description => "Crazy awesome environs.", :unit_price => "450", :merchant_id => "12334395", :created_at => "2016-01-11 11:46:07 UTC", :updated_at => "1999-09-10 14:00:52 UTC"})
    ir.add_data({:id => "263399747", :name => "Grande latte", :description => "Determine what environs are.", :unit_price => "5100", :merchant_id => "12334397", :created_at  => "2016-01-11 11:46:07 UTC", :updated_at  => "1999-09-10 14:00:52 UTC"})

    assert_equal 2, ir.find_all_by_merchant_id(12334395).length
  end

  def test_generate_from_file_exists
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal true, ir.all.length > 10
  end

  def test_find_by_id_works_generated_from_file
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal 50, ir.find_by_name("Test Item").id
  end

  def test_repo_finds_by_name_from_file
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal 50, ir.find_by_name("Test Item").id
  end

  def test_repo_finds_by_price_from_csv
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal 50, ir.find_all_by_price(123.00)[0].id
    assert_equal 66, ir.find_all_by_price("904.35")[0].id
  end

  def test_repo_finds_using_description_from_csv
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal "Test Item", ir.find_all_with_description("Test")[0].name
    assert_equal "Test Item", ir.find_all_with_description("is a")[0].name
    assert_equal true, ir.find_all_with_description("this").length > 5
  end

  def test_find_all_in_price_range_works_with_csv
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal true, ir.find_all_by_price_in_range(Range.new(0,1000)).length > 1
  end

  def test_find_by_merchant_id_works_with_csv
    ir = ItemRepository.new("./data/test_items.csv", self)

    assert_equal "Test Item", ir.find_all_by_merchant_id(10)[0].name
  end
end
