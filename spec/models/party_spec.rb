require 'rails_helper'

RSpec.describe Party, type: :model do 

    it "should persist a party" do 
        user = User.create(email: "mael@gmail.com", password: "azerty")
        game = Game.create(user: user)
        party = Party.create(ten_letters_list: "AEIOURTPDF", word: "ou", game: game)
        expect(Party.count).to eq(1)
    end

    it "party is valid" do 
        party = Party.new(ten_letters_list: "AEIOURTPDF", word: "OU")
        Word.create(word: "OU")
        puts party.is_valid
        expect(party.is_valid).to eq(true)
    end

    it "party generation letters list are valid" do 
        letters = Array('A'..'Z')
        list = Party.generate_ten_letters_list
        list.chars.each do |l|  
            expect(letters.include? l).to eq(true)
        end
    end     
end
