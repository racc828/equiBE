class CreateMidpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :midpoints do |t|
      t.float :latitude
      t.float :longitude
      t.integer :search_id

      t.timestamps
    end
  end
end
