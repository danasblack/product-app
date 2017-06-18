class ProducApp < ActiveRecord::Base  
  belongs_to :supplier
  has_many :images

  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :categorized_products
  has_many :users, through: :carted_products
  
  has_many :categories, through: :categorized_products
  has_many :categorized_products

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :name, uniqueness: true
  # validates :price, presence: true, if: :integer
  # validates :price, presence: true, if: :greater_than
  validates :supplier_id, presence: true

  def sale_message
    if price < 299
      return "Discount Item!"
    else
      return "On Sale!" 
    end   
  end 
  
  def tax
    price * 0.09
  end  

  def total
    price + tax
  end  

  def printable_category_names
    names = categories.map { |category| category.name }.join(", ")
  end
end

