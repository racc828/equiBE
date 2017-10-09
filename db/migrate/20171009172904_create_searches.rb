class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :address1
      t.string :address2
      t.string :address3

      t.timestamps
    end
  end
end
