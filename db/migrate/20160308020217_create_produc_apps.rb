class CreateProducApps < ActiveRecord::Migration
  def change
    create_table :produc_apps do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.string :description

      t.timestamps null: false
    end
  end
end
