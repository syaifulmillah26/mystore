class CreateSpreeAbout < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_abouts do |t|
      t.text :text

      t.timestamps
    end
  end
end
