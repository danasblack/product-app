class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  belongs_to :produc_app

  validates :status, inclusion: { in: %w(carted purchased removed)}
end
