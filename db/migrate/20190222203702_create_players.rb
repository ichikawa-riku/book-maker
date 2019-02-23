class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :odds, null: false
    end
  end
end
