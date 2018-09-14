require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './reviews.rb'
require_relative './products.rb'

class Scraper
  
  def self.scrape_site
    html = (open("https://www.rtings.com/"))
    doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_products 
    self.scrape_site.css(".home-table .home-tile-title").text.split
  
  end
  
  def self.new_products
    self.scrape_products.each do |item|
     product = Product.new(item) unless Product.all.include?(item)
   end
  end

 def self.scrape_reviews
     titles = []
     list = Scraper.scrape_site.css('.home-table .silo-activity ul')
     titles << list
     
    list.each.with_index do |item, index|
        item.css('li').each do |article|
        @title = article.css('a').text
        @date = article.css('.pub-date').text
        @url = article.css("a").attribute('href').value
        @product = Product.all.find do |p|
          p.name == self.scrape_products[index]
        end
      review = Review.new(@title, @date, "https://www.rtings.com#{@url}", @product)
      binding.pry
      # review.product = self.scrape_products[index]
      # review.title = @title
      # review.date = @date
      # review.url = "https://www.rtings.com#{@url}"
      review.save
      # puts self.scrape_products[index]
      # puts "#{@product}"
      # puts "#{@date}"
      # puts "#{@name}"
      # puts " "
      # puts "https://www.rtings.com#{@url}"
      # puts " "
      end
    end  
  end
end

     Scraper.scrape_products
      Scraper.new_products
      Scraper.scrape_reviews