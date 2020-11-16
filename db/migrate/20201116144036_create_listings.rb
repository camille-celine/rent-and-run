class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.boolean :availability
      t.string :picture

      t.timestamps
    end
  end
end
