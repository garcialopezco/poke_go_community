class CreateJoinTableUserRaid < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :raids do |t|
      t.index [:user_id, :raid_id]
      t.index [:raid_id, :user_id]
    end
  end
end
