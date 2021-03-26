class AddBlacklistedToSpreeOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :blacklisted, :boolean
  end
end
