=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
    def initialize(string)
        @string = string
    end

    def rows
        @string.split("\n").map do |row|
            row.split.map {|n| n.to_i }
        end
    end

    def columns
        rows.transpose
    end
end
