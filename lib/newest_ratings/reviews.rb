require 'pry'
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
    @synopsis = synopsis
  end
  
  def self.clear
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
  
  def self.list_reviews_by_product(product)
    @@all.find.with_index do |review, index|
      review.product == product
      puts "#{index+1}. #{review.date} - #{review.title}"
      # Product.add_review(self)
      binding.pry
    end
  end
  
  def list_synopsis
    
  end

end