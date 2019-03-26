class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :points, null: false
      t.timestamps
    end
  end
end
