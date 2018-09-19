class Review

  attr_accessor :title, :date, :url, :product

   @@all = []
  
  def initialize(title, date, url, product)
    @title = title 
    @date = date
    @url = url
    self.product = product
    @product.add_review(self)
     remove_bad_urls
  end
 
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
  
  def remove_bad_urls
    Product.all.each do |product|
    product.reviews.delete_if do |item|
      item.title.include?("Video:") || item.url.include?("youtu")
      end
    end
  end
  
end