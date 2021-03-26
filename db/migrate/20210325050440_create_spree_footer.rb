class CreateSpreeFooter < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_footers do |t|
      t.string :company_name
      t.text :address
      t.string :website
      t.string :facebook_url
      t.string :instagram_url
      t.string :twitter_url
      t.string :whatsapp_number

      t.timestamps
    end
  end
end
