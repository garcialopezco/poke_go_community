class CreateRaids < ActiveRecord::Migration[5.2]
  def change
    create_table :raids do |t|
      t.references :gym, foreign_key: true
      t.string :boss
      t.datetime :time
      t.integer :remaining_time, default: 44
      t.boolean :expired, default: false

      t.timestamps
    end
  end
end
