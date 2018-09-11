require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  def self.scrape_site
    html = (open("https://www.rtings.com/"))
    doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_products 
    self.scrape_site.css(".home-table .home-tile-title").text
    binding.pry
  end
  
end

Scraper.scrape_products