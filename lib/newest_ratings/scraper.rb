require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  def self.scrape_site
    html = (open("https://www.rtings.com/"))
    doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_products 
    products = self.scrape_site.css(".home-table .home-tile-title").text
    # date = scrape_site.css(".home-table .silo-activity li .pub-date").text
    # date = scrape_site.css('.home-table .silo-activity li span').first.text
    # title & URL = scrape_site.css(".home-table .silo-activity li a")
    # title & date = scrape_site.css('.home-table .silo-activity li').first.children.text
    # text = scrape_site.css('.home-table .silo-activity li').children.children.children
    binding.pry
  end
  
end

Scraper.scrape_products