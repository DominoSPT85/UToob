class ChangeDurationType < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :duration, :string
  end
end
