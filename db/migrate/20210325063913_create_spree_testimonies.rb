class CreateSpreeTestimonies < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_testimonies do |t|
      t.text :text

      t.timestamps
    end
  end
end
