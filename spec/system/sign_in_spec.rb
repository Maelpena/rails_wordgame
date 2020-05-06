require 'spec_helper'
require 'rails_helper'

RSpec.describe "Sign_in:" do
    it "should have the title 'Log in'" do
      visit "/users/sign_in"
      page.should have_selector('h2', text: 'Log in')
    end
end 