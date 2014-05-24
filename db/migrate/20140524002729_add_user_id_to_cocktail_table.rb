class AddUserIdToCocktailTable < ActiveRecord::Migration
  def change
    add_column :cocktails, :user_id, :integer
  end
end
