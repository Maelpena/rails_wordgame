require 'rails_helper'

RSpec.describe Game, type: :model do 

    it "should persist a party" do 
        user = User.create(email: "mael@gmail.com", password: "azerty")
        game = Game.create(user: user)

        expect(Game.count).to eq(1)
    end
    
end
