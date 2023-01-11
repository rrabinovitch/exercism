=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
    def self.compute(strand_1, strand_2)
        raise ArgumentError.new unless strand_1.length == strand_2.length
        hamming_distance = 0
        strand_1.chars.each_with_index do |char, i|
            hamming_distance += 1 unless char == strand_2[i]
        end
        hamming_distance
    end
end

