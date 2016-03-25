class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cartedproducts
  has_many :orders, through: :cartedproducts
  has_many :produc_apps, through: :cartedproducts
end
