require 'test/unit'
require_relative 'array_processor'

class TestArrayProcessor < Test::Unit::TestCase
  def setup
    @array = [1, 2, 3, 4, 5, 6, 7, 10, 12]
    @processor = ArrayProcessor.new(@array)
  end

  def test_elements
    assert_equal(@array, @processor.elements)
    assert(@processor.elements.frozen?, 'Array should be frozen')
  end

  def test_custom_detect
    assert_equal(6, @processor.custom_detect { |el| el > 5 })
    assert_nil(@processor.custom_detect { |el| el > 15 })
    assert_nil(@processor.custom_detect)
  end

  def test_custom_map
    assert_equal([2, 4, 6, 8, 10, 12, 14, 20, 24], @processor.custom_map { |el| el * 2 })
    assert_equal([], @processor.custom_map)
  end

  def test_custom_select
    assert_equal([2, 4, 6, 10, 12], @processor.custom_select { |el| el.even? })
    assert_equal([], @processor.custom_select { |el| el > 15 })
    assert_equal([], @processor.custom_select)
  end

  def test_custom_sort
    assert_equal([12, 10, 7, 6, 5, 4, 3, 2, 1], @processor.custom_sort { |a, b| a > b })
    assert_equal(@array, @processor.custom_sort)
  end

  def test_custom_max
    assert_equal(12, @processor.custom_max)
    assert_equal(12, @processor.custom_max { |a, b| a <=> b })
    empty_processor = ArrayProcessor.new([])
    assert_nil(empty_processor.custom_max)
  end

  def test_custom_drop_while
    assert_equal([5, 6, 7, 10, 12], @processor.custom_drop_while { |el| el < 5 })
    assert_equal(@array, @processor.custom_drop_while { |el| el > 20 })
    assert_equal(@array, @processor.custom_drop_while)
  end
end