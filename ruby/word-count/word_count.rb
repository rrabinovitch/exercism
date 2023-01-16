=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
    def initialize(phrase)
        @phrase = phrase
    end

    def word_count
        # binding.pry
        @phrase.scan(/[\w']+/).inject(Hash.new(0)) do |word_counter, word|
            # binding.pry
            word_counter[word.downcase] += 1
            word_counter
        end
        # binding.pry
    end
end
