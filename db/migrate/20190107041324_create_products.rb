class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.references :user,null: false,foreign_key: true
      t.references :category,null: false, foreign_key: true
      t.integer :condition,null: false
      t.references :area,null: false, foreign_key: true
      t.integer :shipmentday ,null: false
      t.integer :price,precision: 10,scale: 0
      t.timestamps
    end
  end
end
