class AddIsValidateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_users, :is_validate, :boolean, default: false
  end
end
