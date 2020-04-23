class ChangeUserTable < ActiveRecord::Migration[6.0]
  def change
      change_table :users do |u|
        u.integer :best_score
        u.integer :nb_game
      end
  end
end
