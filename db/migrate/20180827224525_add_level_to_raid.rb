class AddLevelToRaid < ActiveRecord::Migration[5.2]
  def change
    add_column :raids, :level, :integer
  end
end
