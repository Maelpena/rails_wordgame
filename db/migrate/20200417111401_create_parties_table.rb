class CreatePartiesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :ten_letters_list
      t.string :word
      t.boolean :available
    end
  end
end
