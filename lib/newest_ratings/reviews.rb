require 'pry'
class Review

  attr_accessor :title, :date, :url
  attr_reader :product

  @@all = []
  
  def initialize(title, date, url, product=nil)
    @title = title 
    @date = date
    @url = url
    @product = product if product
  end
  
  def product=(product)
    @product = product
    Product.add_review(self)
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
    end
  end
  

end