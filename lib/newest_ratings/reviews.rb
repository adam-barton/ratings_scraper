require 'pry'
class Review

  attr_accessor :title, :date, :url
  attr_reader :product

  @@all = []
  
  def initialize(title, date, url, product=nil)
    @title = title 
    @date = date
    @url = url
  end
  
  def product=(product)
    @product = product
    Product.add_review(self)
  end
  
  
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
  
  def self.list_reviews_by_product(product)
    @@all.find do |review|
      review.product == product
      self
    end
  end
  

end