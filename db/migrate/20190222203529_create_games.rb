class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title, null:false
      t.text :detail, null:true
      t.datetime :closed_at, null:false
      t.boolean :is_closed, null:false, default: false
      t.datetime :finished_at, null:false
      t.boolean :is_finished, null:false, default: false
      t.timestamps
    end
  end
end
