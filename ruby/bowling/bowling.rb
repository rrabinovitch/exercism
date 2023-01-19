=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end
class Game
    attr_reader :score
    
    def initialize
        @score = 0
    end

    def roll(pins)
        @score += pins
    end
end
