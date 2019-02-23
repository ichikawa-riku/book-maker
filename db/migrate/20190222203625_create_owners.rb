class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
    end
  end
end
