=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end
class Game
    def initialize
        @frames = Hash.new { |hash, key| hash[key] = {rolls: [], frame_type: nil} }
        @current_frame = 1
    end

    def roll(pins_hit)
        raise BowlingError if pins_hit < 0 || pins_hit > 10

        # method does not work if a non-bonus frame amounts to more than 10 pins across both rolls
        # but DOES work if it's a bonus frame after bonus strike roll
        if !@frames[@current_frame][:rolls].empty?
            unless @frames[@current_frame][:frame_type] == :bonus && @frames[@current_frame][:rolls].first == 10
                raise BowlingError if @frames[@current_frame][:rolls].first + pins_hit > 10
            end
        end

        @frames[@current_frame][:rolls] << pins_hit
        # bonus => (score is only counted as addition to previous frame)
        if @current_frame > 10
            @frames[@current_frame][:frame_type] = :bonus
        # open =>
            # if this is second roll of frame and total pins hit across two rolls < 10: frame_type: :open and move onto next frame (@current_frame += 1)
        elsif @frames[@current_frame][:rolls].count == 2 && @frames[@current_frame][:rolls].sum < 10
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
        score = 0
        @frames.each do |frame, frame_data|
        # open ==> if rolls.sum < 10: score += rolls.sum
            if frame_data[:frame_type] == :open
                score += frame_data[:rolls].sum
        # spare ==> if rolls.count == 2 && rolls.sum == 10: score = score + rolls.sum + @frames[frame + 1].first
            elsif frame_data[:frame_type] == :spare
                score = score + frame_data[:rolls].sum + @frames[frame + 1][:rolls].first
        # strike ==> if rolls.count == 1 && rolls.sum == 10 (OR JUST if rolls.first == 10): score = score + 10 + @frames[frame + 1].sum
            elsif frame_data[:frame_type] == :strike
                score = score + 10 + @frames[frame + 1][:rolls].sum if @frames[frame + 1][:frame_type] != :strike
                score = score + 20 + @frames[frame + 2][:rolls].first if @frames[frame + 1][:frame_type] == :strike
        # bonus ==> score isn't changed
            elsif frame_data[:frame_type] == :bonus
                score = score
            end
        end
        score
    end

    class BowlingError < StandardError; end
end



               # if @frames.keys.include?(frame + 2)
                #     score = score + 10 + @frames[frame + 1][:rolls].sum + @frames[frame + 2][:rolls].sum
                # elsif @frames[frame + 1][:frame_type] != :strike
                #     score = score + 10 + @frames[frame + 1][:rolls].sum
                # elsif @frames[frame + 1][:frame_type] == :strike
                #     score = score + 20 + @frames[frame + 2][:rolls].first
                # end




        # # bonus => (score is only counted as addition to previous frame)
        # if @current_frame > 10
        #     @frames[@current_frame][:frame_type] = :bonus
        #     # @current_frame += 1 if @frames[@current_frame][:rolls].last == 10
