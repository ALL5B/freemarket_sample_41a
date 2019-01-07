class RenameUserIdColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :user_id, :seller
  end
end
