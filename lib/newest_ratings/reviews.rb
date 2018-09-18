class Review

  attr_accessor :title, :date, :url, :product, :synopsis
  attr_reader 

  @@all = []
  
  def initialize(title, date, url, product)
    @title = title 
    @date = date
    @url = url
    self.product = product
    @product.add_review(self)
  end
 
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
end