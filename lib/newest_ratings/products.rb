class NewestRatings::Product

#Product types are:
  #Televisions
  #Monitors
  #Headphones

  attr_accessor :product, :reviews


  def initialize(product)
    @product = product
    @product_reviews = []
  end

  def choice
    puts "#{@Product}, excellent choice."
    puts " "
    puts "Here are the latest reviews:"
  end

  def reviews
    review.product = self 
    @product_reviews << self
    binding.pry
  end
  
end
