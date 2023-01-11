=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
class Series
    def initialize(digits_string)
        @digits_string = digits_string
    end

    def slices(slice_length)
        [@digits_string]
    end
end
