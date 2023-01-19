=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end
class Game
    # attr_reader :score
    def initialize
        @frames = Hash.new { |hash, key| hash[key] = {rolls: [], frame_type: nil} } # regular hash initialization with default values was not actually storing values set in #roll method
        @current_frame = 1
    end

    def roll(pins_hit)
        @frames[@current_frame][:rolls] << pins_hit
        # open =>
            # if this is second roll of frame and total pins hit across two rolls < 10: frame_type: :open and move onto next frame (@current_frame += 1)
        if @frames[@current_frame][:rolls].count == 2 && @frames[@current_frame][:rolls].sum < 10
            @frames[@current_frame][:frame_type] = :open
            @current_frame += 1
        # spare =>
            # if this is second roll of frame and total pins hit across two rolls == 10: frame_type: :spare and move onto next frame (@current_frame += 1)
        elsif @frames[@current_frame][:rolls].count == 2 && @frames[@current_frame][:rolls].sum == 10
            @frames[@current_frame][:frame_type] = :spare
            @current_frame += 1
        # strike =>
            # if this is first roll of frame and pins hit == 10: frame_type: :strike and move onto next frame (@current_frame += 1)
        elsif @frames[@current_frame][:rolls].count == 1 && pins_hit == 10
            @frames[@current_frame][:frame_type] = :strike
            @current_frame += 1
        end
    end

    def score
        binding.pry
        score = 0
        @frames.each do |frame, rolls|
            # open ==> if rolls.sum < 10: score += rolls.sum
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


    
    # def initialize
    #     # @score = 0
    #     @frames = Hash.new()
    #     @current_frame = 1
    # end

    # def roll(pins_hit)
    #     # if the first roll of a frame hasn't been recorded yet, create a new hash key
    #     if @frames[@current_frame].nil?
    #         # record first roll
    #         @frames[@current_frame] = [pins_hit]
    #     else # if first roll of a frame has already been recoreed, record the second roll
    #         @frames[@current_frame] << pins_hit
    #     end
    #     # if pins_hit represents the second roll of a frame OR if pins_hit == 10: @current_frame += 1
    #     if @frames[@current_frame].count == 2 || pins_hit == 10
    #         # "end" the current frame and set up for next frame by adding 1 to @current_frame
    #         @current_frame += 1
    #     end
    #     pins_hit # overriding implicit return of above conditional so that relevant info is returned instead of current frame number
    # end




    #############


    # attr_accessor :frames
    
    # def initialize
    #     # @score = 0
    #     @frames = Hash.new({rolls: [], frame_type: nil})
    #     @current_frame = 1
    # end

    # def roll(pins_hit)
    #     # if the first roll of a frame hasn't been recorded yet, create a new hash key
    #     binding.pry
    #     if @frames[@current_frame][:rolls].nil?

    #         # if @current_frame > 10
    #         #     binding.pry
    #         # end

    #         # record first roll
    #         @frames[@current_frame][:rolls] << pins_hit
    #     else # if first roll of a frame has already been recoreed, record the second roll
    #         binding.pry
    #         @frames[@current_frame][] << pins_hit
    #     end
    #     # if pins_hit represents the second roll of a frame OR if pins_hit == 10: @current_frame += 1
    #     if @frames[@current_frame][:rolls].count == 2 || pins_hit == 10
    #         # "end" the current frame and set up for next frame by adding 1 to @current_frame
    #         @current_frame += 1
    #     end
    #     pins_hit # overriding implicit return of above conditional so that relevant info is returned instead of current frame number
    # end
