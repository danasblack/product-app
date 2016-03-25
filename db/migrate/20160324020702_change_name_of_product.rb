class ChangeNameOfProduct < ActiveRecord::Migration
  def change
    rename_column :categorized_products, :product_id, :produc_app_id
  end
end
