=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end
class Game
    # attr_reader :score
    
    def initialize
        # @score = 0
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
        score = 0
        @frames.each do |frame, rolls|
            # open frame ==> if rolls.sum < 10: score += rolls.sum
            if rolls.sum < 10
                score += rolls.sum
            # spare ==> if rolls.count == 2 && rolls.sum == 10: score = score + rolls.sum + @frames[frame + 1].first
            elsif rolls.count == 2 && rolls.sum == 10
                score = score + rolls.sum + @frames[frame + 1].first
            # strike ==> if rolls.count == 1 && rolls.sum == 10 (OR JUST if rolls.first == 10): score = score + 10 + @frames[frame + 1].sum
            elsif rolls.first == 10
                score = score + 10 + @frames[frame + 1].sum
            end
        end
        score
    end
end
