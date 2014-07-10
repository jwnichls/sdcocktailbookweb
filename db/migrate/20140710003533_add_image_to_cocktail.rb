class AddImageToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :image, :string
  end
end
