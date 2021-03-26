class AddTitleToSpreeTestimony < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_testimonies, :title, :string
    add_column :spree_testimonies, :name, :string
  end
end
