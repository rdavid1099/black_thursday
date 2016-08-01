require './test/test_helper'
require './lib/file_reader'

class TestFileReader < Minitest::Test
  include FileReader

  def setup
    @test_array = Array.new
  end

  def add_data(content)
    @test_array << content
  end

  def test_file_reader_loads_data_using_pathname
    generate_from_file('./data/test_merchants.csv', self)

    assert_equal 20, @test_array.length
  end
end
