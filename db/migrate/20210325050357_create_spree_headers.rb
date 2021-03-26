class CreateSpreeHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_headers do |t|
      t.text :text
      t.string :video_embed_url

      t.timestamps
    end
  end
end
