require 'pry'
class Product

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
  
  def self.list_products
    @@all.each.with_index do |p, index|
      puts "#{index +1} - #{p.name}"
    end
  end
  
  def add_review(review)
    review.product = self 
    @reviews << review 
  end
  
  def self.list_reviews(product)
    Review.all.collect do |review|
      review.product == product
    end
  end

  def choice
    puts "#{@product}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"
  end
end

# Product.list_reviews("Monitors")
