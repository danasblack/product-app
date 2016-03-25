class Category < ActiveRecord::Base
  has_many :categorized_products
  has_many :produc_apps, through: :categorized_products
end
