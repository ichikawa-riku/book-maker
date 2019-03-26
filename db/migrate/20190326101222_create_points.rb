class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true, index: true
      t.references :bet, foreign_key: true, index: true
      t.integer :point
      t.text :reason, null: true
      t.timestamps
    end
  end
end
