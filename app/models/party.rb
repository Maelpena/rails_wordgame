class Party < ApplicationRecord
    belongs_to :game 

    def self.generate_ten_letters_list
        consonant = Array('A'..'Z')
        vowel = ['A','E','I','O','U','Y']
        consonant -= vowel
        @letters = Array.new(5) { consonant.sample } + Array.new(5) { vowel.sample }
        
        return @letters.sort!{|x,y|rand<=>rand}.join
    end
    
    def is_valid
        chars = self.ten_letters_list.chars
        self.word.upcase.chars.each do |l|
            if chars.include? l
                index = chars.index(l)
                chars.slice!(index)
            else
                return false
            end   
        end
        if !Word.where(word: self.word.upcase).exists?
            return false
        end
        return true
    end

    def best_solution
        solution = []
        words = Word.all
        words.each do |w|
            chars = self.ten_letters_list.chars
            w.word.chars.each_with_index do |l, i|
                if chars.include? l
                    index = chars.index(l)
                    chars.slice!(index)
                else
                    break
                end
                if w.word.size-1 == i
                    solution << w.word
                end
            end
        end
        solution = solution.sort_by{ |word| word.length }
        return solution.last(10)
    end
end