class CreateAddNameToCategories < ActiveRecord::Migration
  def change
    create_table :add_name_to_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
