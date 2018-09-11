class Scraper
  
  def scrape_site
    html = (open("https://www.rtings.com/"))
    doc = Nokogiri::HTML(html)
  end
  
  def scrape_products 
    self.scrape_site.css(".home-table .home-tile-title").text
  end
  
end