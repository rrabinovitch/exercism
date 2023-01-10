=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end

class CircularBuffer
  def initialize(size)
    # @size = size
  end

  def read
    raise BufferEmptyException 
  end

  def write(element)
  end

  class BufferEmptyException < StandardError; end
end