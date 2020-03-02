class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :address
      t.date :date
      t.time :time
      t.integer :price
      t.string :sport
      t.string :format
      t.integer :available_spaces
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
