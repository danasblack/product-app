class AddSupplierIdToProducApps < ActiveRecord::Migration
  def change
    add_column :produc_apps, :supplier_id, :integer
  end
end
