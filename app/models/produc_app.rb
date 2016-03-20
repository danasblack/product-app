class ProducApp < ActiveRecord::Base  
  belongs_to :supplier
  has_many :images
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
end
