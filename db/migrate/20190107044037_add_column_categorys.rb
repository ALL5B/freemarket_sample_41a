class AddColumnCategorys < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :sizetype, index: true
  end
end
