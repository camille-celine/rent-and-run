class AddCategoryToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :category, :string
  end
end
