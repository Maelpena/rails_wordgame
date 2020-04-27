class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :score, :integer
    remove_column :games, :party_index, :integer
    remove_column :games, :is_finished, :boolean
    remove_column :parties, :available, :boolean
    remove_column :users, :nb_game, :integer

  end
end
