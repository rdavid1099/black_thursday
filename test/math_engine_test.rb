require './test/test_helper'
require './lib/math_engine'

class TestMathEngine < Minitest::Test
  include MathEngine

  def test_find_average_finds_the_correct_average
    actual = find_average([2,3,4])
    expected = 3.0

    assert_equal expected, actual
  end

  def test_math_engine_finds_larger_average
    actual = find_average([35, 243, 1234567, 234.5, 357.23, 9402]).round(2)
    expected = 207473.12

    assert_equal expected, actual
  end

  def test_math_engine_calculates_sum_of_squared_data
    average = find_average([2,3,4])
    actual = sum_of_squared_data([2,3,4], average)
    expected = 2.0

    assert_equal expected, actual
  end

  def test_math_engine_calculates_std_deviation
    average = find_average([2,3,4])
    actual = standard_deviation([2,3,4], average, 3)
    expected = 1.0

    assert_equal expected, actual
  end

  def test_math_engine_finds_larger_std_deviation
    average = find_average([35, 243, 1234567, 234.5, 357.23, 9402]).round(2)
    actual = standard_deviation([35, 243, 1234567, 234.5, 357.23, 9402], average, 6)
    expected = 503184.61

    assert_equal expected, actual
  end
end
