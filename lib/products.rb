class Product

#Product types are:
  #Televisions
  #Monitors
  #Headphones

  attr_accessor :product, :reviews
  
  @@product_reviews = []

  def initialize(product)
    @product = product
  end

  def choice
    puts "#{@Product}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"
    self.reviews 
  end

  def reviews(review)
    review.product = self 
    @@product_reviews << self
     end
  end
  
end
