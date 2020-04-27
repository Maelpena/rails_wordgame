class Game < ApplicationRecord
    belongs_to :user
    has_many :parties
    
    def self.find_or_create(current_user)
        game = Game.where(user_id: current_user.id).last
        if game == nil || game.parties.count >= 5 
            game = Game.create(user_id: current_user.id)
        end
        return game
    end
end