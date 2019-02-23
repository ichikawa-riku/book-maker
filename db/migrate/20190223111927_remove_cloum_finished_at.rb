class RemoveCloumFinishedAt < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :finished_at, :datatime
  end
end
