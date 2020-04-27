class PartiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home]
    before_action :set_game, only: [:create]
    def new    
        puts Party.generate_ten_letters_list
        @party = Party.new(ten_letters_list: Party.generate_ten_letters_list)
    end


    def create
        @party = Party.new(party_params)
        if @party.is_valid

            @party.game_id = @game.id
            @party.save

            current_user.set_best_score(@game.parties.map {|w| w.word.length }.sum)

            redirect_to "/parties/show"
        else 
            flash[:notice] = 'Vous devez rentrer un mot en utilisant les lettres ci-dessus'
            render :new
        end
    end 


    def show
        @party = Party.last
        @game = Game.find(@party.game_id)
        @best_results = @party.best_solution
    end

    def set_game
        @game = Game.find_or_create(current_user)
    end
    
  def party_params
    params.require(:party).permit(
      :ten_letters_list,
      :word)
    end
end
  