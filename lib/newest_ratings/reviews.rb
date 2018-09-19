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
    # remove_bad_urls
  end
 
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
  
  # def remove_bad_urls
  #   # @@all.find_all |reviews|
  #   # reviews.url.include?("youtu.be") || reviews.title.include?("Video:")
  #   # reviews.pop
  #   # end
  #   # @@all.delete_if do |review| 
  #   #   review.url.include?("youtu.be") || review.title.include?("Video:")
  #   # end
  # end
  
end