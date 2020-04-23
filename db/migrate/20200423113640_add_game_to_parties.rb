class AddGameToParties < ActiveRecord::Migration[6.0]
  def change
    add_reference :parties, :game, foreign_key: true
  end
end


