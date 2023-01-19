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
        @frames = Hash.new()
        @current_frame = 1
    end

    def roll(pins_hit)
        # if the first roll of a frame hasn't been recorded yet, create a new hash key
        if @frames[@current_frame].nil?
            # record first roll
            @frames[@current_frame] = [pins_hit]
        else # if first roll of a frame has already been recoreed, record the second roll
            @frames[@current_frame] << pins_hit
        end
        # if pins_hit represents the second roll of a frame OR if pins_hit == 10: @current_frame += 1
        if @frames[@current_frame].count == 2 || pins_hit == 10
            # "end" the current frame and set up for next frame by adding 1 to @current_frame
            @current_frame += 1
        end
        pins_hit # overriding implicit return of above conditional so that relevant info is returned instead of current frame number
    end

    def score
        binding.pry
    end
end
