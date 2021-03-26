class AddPositionToTestimony < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_testimonies, :position, :integer
  end
end
