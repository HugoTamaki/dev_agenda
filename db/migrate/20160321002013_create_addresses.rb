class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :event_id
      t.string :street
      t.string :state
      t.string :city
      t.string :district
      t.string :number
      t.string :coordinates_x
      t.string :coordinates_y

      t.timestamps null: false
    end

    add_index :addresses, :event_id
  end
end
