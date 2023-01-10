=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end

class CircularBuffer
  def initialize(size)
    @max_size = size
    @current_size = 0
    @newest = -1
    @oldest = -1
    @current_state = current_state
  end

  def current_state
    buffer = Array.new
    buffer[@max_size - 1] = nil
    buffer
  end

  def read
    raise BufferEmptyException unless @current_size > 0
    value = @current_state[@newest]
    @current_state[@newest] = nil
    @newest -= 1
    @current_size -= 1
    value
  end

  def write(element)
    @current_size += 1
    @current_state[@newest] = element
    @newest += 1
  end

  class BufferEmptyException < StandardError; end
end
