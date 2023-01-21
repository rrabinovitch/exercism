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
        @game_complete = false
    end

    def roll(pins_hit)
        raise BowlingError.new("Cannot roll a negative number of pins") if pins_hit < 0
        raise BowlingError.new("Cannot roll more than 10 pins") if pins_hit > 10
        raise BowlingError.new("Cannot roll after 10th frame complete") if @game_complete

        # raise exception if a non-bonus frame amounts to more than 10 pins across both rolls
        # DOESNT raise exception if it's a bonus frame after bonus strike roll
        if !@frames[@current_frame][:rolls].empty?
            unless @frames[@current_frame][:frame_type] == :bonus && @frames[@current_frame][:rolls].first == 10
                raise BowlingError.new("A frame's rolls cannot amount to more than 10 pins total") if @frames[@current_frame][:rolls].first + pins_hit > 10
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

        game_complete?
    end

    def game_complete?
        # game is complete when the second roll of the 10th frame is done and it was an open frame
        @game_complete = true if !@frames[10][:rolls].nil? && @frames[10][:rolls].count == 2
        # OR when a 10th-frame-spare has been rolled and then one more bonus frame roll is complete
        if @frames[10][:frame_type] == :spare
            binding.pry
        end
        @game_complete = true if @frames[10][:frame_type] == :spare && @frames[11][:rolls].count == 1
        # OR when a 10th-frame-strike has been rolled and then two more bonus frame rolls are complete
        @game_complete = true if @frames[10][:frame_type] == :strike && @frames[11][:rolls].count == 2

        # if @game_complete
        #     puts "game is complete"
        #     puts @frames
        # end



        # {1=>{:rolls=>[0, 0], :frame_type=>:open},
        # 10=>{:rolls=>[7, 3], :frame_type=>:spare},
        # 2=>{:rolls=>[0, 0], :frame_type=>:open},
        # 3=>{:rolls=>[0, 0], :frame_type=>:open},
        # 4=>{:rolls=>[0, 0], :frame_type=>:open},
        # 5=>{:rolls=>[0, 0], :frame_type=>:open},
        # 6=>{:rolls=>[0, 0], :frame_type=>:open},
        # 7=>{:rolls=>[0, 0], :frame_type=>:open},
        # 8=>{:rolls=>[0, 0], :frame_type=>:open},
        # 9=>{:rolls=>[0, 0], :frame_type=>:open},
        # 11=>{:rolls=>[], :frame_type=>nil}}
    end

    def score
        # raise BowlingError.new("Game cannot be scored unless it's complete") unless @frames.keys.include?(10) # consider better way to assess this logic bc this would still allow for scoring after the first roll of 10th frame, or before bonus rolls are complete
        raise BowlingError.new("Game cannot be scored unless it's complete") unless @game_complete

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
