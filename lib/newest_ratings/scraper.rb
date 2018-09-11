class NewestRatings::Scraper
  
  def scrape_site
    Nokogiri::HTML(open("https://www.rtings.com/"))
  end
  
  def scrape_products 
    self.scrape_site.css(".home-table .home-tile-title")
    binding.pry
  end
  
end