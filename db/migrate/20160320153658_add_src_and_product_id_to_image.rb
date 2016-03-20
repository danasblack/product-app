class AddSrcAndProductIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :src, :string
    add_column :images, :product_id, :integer
  end
end
