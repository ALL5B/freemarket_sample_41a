class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.text :image,null: false
      t.references :product,null: false

      t.timestamps
    end
  end
end
