require 'rails_helper'

RSpec.describe User, type: :model do 

    it "should persist a party" do 
        user = User.create(email: "mael@gmail.com", password: "azerty")
        expect(User.count).to eq(1)
    end

    it "should update best score" do 
        user = User.create(email: "mael@gmail.com", password: "azerty")
        user.set_best_score(5)
        user.set_best_score(15)
        user.set_best_score(10)
        expect(user.best_score).to eq(15)
    end
end
