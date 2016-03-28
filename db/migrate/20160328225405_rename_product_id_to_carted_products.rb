class RenameProductIdToCartedProducts < ActiveRecord::Migration
  def change
    rename_column :carted_products, :product_id, :produc_app_id
  end
end
