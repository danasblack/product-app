class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :produc_apps, through: :carted_products
 
end
