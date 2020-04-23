class EditGameTable < ActiveRecord::Migration[6.0]
  def change
    change_table :games do |g|
      g.boolean :is_finished  
    end
  end
end
