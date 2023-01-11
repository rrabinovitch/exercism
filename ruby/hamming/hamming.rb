=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
    def self.compute(strand_1, strand_2)
        hamming_distance = 0
        # 0 if strand_1 == strand_2
        strand_1.chars.each_with_index do |char, i|
            hamming_distance += 1 unless char == strand_2[i]
        end
        hamming_distance
    end
end

