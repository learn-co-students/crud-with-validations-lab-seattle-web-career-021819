class ChangeReleasedBackToText < ActiveRecord::Migration[5.0]
  def change
    change_column :songs, :released, :text
  end
end
