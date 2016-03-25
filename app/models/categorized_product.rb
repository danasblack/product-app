class CategorizedProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :produc_app
end
