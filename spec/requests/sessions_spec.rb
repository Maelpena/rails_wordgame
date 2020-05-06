require 'spec_helper'
require 'rails_helper'

RSpec.describe "Sign_in:" do

    it "Get root page" do
        # user = create(:user)    ## uncomment if using FactoryBot
        user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
        sign_in user
        get root_path
        expect(response).to render_template(:new)
        sign_out user
    end

    it "Get show page" do
        # user = create(:user)    ## uncomment if using FactoryBot
        user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
        sign_in user
        game = Game.create(user: user)
        party = Party.create(ten_letters_list: "AEIOURTPDF", word: "ou", game: game)
        get "/parties/show"
        expect(response).to render_template(:show)
        sign_out user
    end
end