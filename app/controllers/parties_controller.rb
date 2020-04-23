class PartiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home]

    def new    
        @party = Party.new
        @party.ten_letters_list = @party.generate_ten_letters_list
       
    end


    def create
        @party = Party.new(party_params)
        if @party.is_valid
            @game = Game.where(is_finished: false, user_id: current_user.id).first
            if @game == nil
                @game = Game.create(user_id: current_user.id, score: 0, is_finished: false)
            end
            @party.game_id = @game.id
            @party.save
            
            @game.score += @party.word.length
            if @game.parties.count >= 5
                @game.is_finished = true
            end
            @game.save
            if current_user.best_score == nil
                current_user.best_score = 0 
            elsif current_user.best_score < @game.score 
                current_user.best_score = @game.score
            end
            current_user.save
            
            redirect_to "/parties/show"
        else 
            flash[:notice] = 'Vous devez rentrer un mot en utilisant les lettres ci-dessus'
            redirect_to new_party_path
        end
    end 


    def show
        @party = Party.last
        @game = Game.find(@party.game_id)
        @best_results = @party.best_solution
    end

    
  def party_params
    params.require(:party).permit(
      :ten_letters_list,
      :word)
    end
end
  