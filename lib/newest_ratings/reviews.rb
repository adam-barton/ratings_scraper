require 'pry'
class Reviews

  attr_accessor :product, :title, :date, :url

  @@all = []
  
  def initialize
    @product = product
    @title = title 
    @date = date
    @url = url
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
  

  def self.latest_activity
    # puts <<-DOC
    # 1. Aug 24 New: Hisense H9E Plus Review
    # 2. Aug 23 New: Video: Vizio P Series Quantum TV Review
    # 3. Aug 20 New: Video: LG B8/C8 OLED Picture Settings
    # DOC

    review_1 = self.new
    review_1.title = "New: Hisense H9E Plus Review"
    review_1.date = "Aug 24"
    review_1.product = "Televisions"
    @@all << review_1

    review_2 = self.new
    review_2.title = "New: Video: Visio P Series Quantum TV Review"
    review_2.date = "Aug 23"
    review_2.product = "Monitors"
    @@all << review_2

    review_3 = self.new
    review_3.title = "New: Video: LG B8/C8 OLED Picture Settings"
    review_3.date = "Aug 20"
    review_3.product = "Headphones"
    @@all << review_3
  end



end