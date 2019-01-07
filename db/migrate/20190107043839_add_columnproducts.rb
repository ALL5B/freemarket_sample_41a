class AddColumnproducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :size, index: true
  end
end
