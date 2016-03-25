class Order < ActiveRecord::Base
  belongs_to :user
  has_many :cartedproducts
  has_many :produc_apps, through: :cartedproducts
 
end
