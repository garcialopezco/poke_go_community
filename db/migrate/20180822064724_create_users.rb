class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :level
      t.string :trainer_phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
