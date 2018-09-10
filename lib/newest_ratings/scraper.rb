class NewestRatings::Scraper
  
  def scrape_site
    Nokogiri::HTML(open("https://www.rtings.com/"))
  end
  
end