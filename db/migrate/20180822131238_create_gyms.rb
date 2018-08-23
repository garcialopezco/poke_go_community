class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :lat
      t.string :long
      t.string :description

      t.timestamps
    end
  end
end
