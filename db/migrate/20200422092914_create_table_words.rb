class CreateTableWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
    end
  end
end
