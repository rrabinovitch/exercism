require 'minitest/autorun'
require_relative 'matrix'
require 'pry'

class MatrixTest < Minitest::Test
  def test_extract_a_row
    # skip
    matrix = Matrix.new("1 2\n10 20")
    assert_equal [1, 2], matrix.rows[0]
    
    assert_equal 2, matrix.rows.count
  end

  def test_extract_same_row_again
    # skip
    matrix = Matrix.new("9 7\n8 6")
    assert_equal [9, 7], matrix.rows[0]

    assert_equal 2, matrix.rows.count
  end

  def test_extract_other_row
    # skip
    matrix = Matrix.new("9 8 7\n19 18 17")
    assert_equal [19, 18, 17], matrix.rows[1]

    assert_equal 2, matrix.rows.count
  end

  def test_extract_other_row_again
    # skip
    matrix = Matrix.new("1 4 9\n16 25 36")
    assert_equal [16, 25, 36], matrix.rows[1]

    assert_equal 2, matrix.rows.count
  end

  def test_extract_a_column
    # skip
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
    assert_equal [1, 4, 7, 8], matrix.columns[0]

    assert_equal 3, matrix.columns.count
  end

  def test_extract_another_column
    # skip
    matrix = Matrix.new("89 1903 3\n18 3 1\n9 4 800")
    assert_equal [1903, 3, 4], matrix.columns[1]

    assert_equal 3, matrix.columns.count
  end

  def test_extract_last_column
    # skip
    matrix = Matrix.new("1 2 3\n10 20 30\n100 200 300")
    assert_equal [3, 30, 300], matrix.columns.last

    assert_equal 3, matrix.columns.count
  end
end

# test: columns method with a different number of columns (2 or 4)
# test: raise exception when rows have differing numbers of elements
# test: raise exception when columns have differing numbers of elements
