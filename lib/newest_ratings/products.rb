require 'pry'
class Product

#Product types are:
  #Televisions
  #Monitors
  #Headphones

  attr_accessor :name
  attr_reader :reviews

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self 
    self
  end
  
  def reviews 
    @reviews
  end
  
  def add_review(review)
    review.product = self 
    @product_reviews << self
  end
  
  def self.find_by_name(name)
    @@all.find do |product|
    product.name == name
  end
  end
  
  

  def choice
    puts "#{@product}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"
  end
end

Product.find_by_name("Monitors")
