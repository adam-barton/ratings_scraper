class Product

#Product types are:
  #Televisions
  #Monitors
  #Headphones

  attr_accessor :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @product_reviews = []
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self 
    self
  end
  
  def reviews 
    @product_reviews
  end
  
  def add_review(review)
    review.product = self unless review.product
    @product_reviews << self
  end
  
  

  def choice
    puts "#{@product}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"
  end

  
end
