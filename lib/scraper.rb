class Scraper
  
  def self.start 
     self.scrape_products
      self.new_products
  end
  
  def self.scrape_site
    
    @doc ||= (Nokogiri::HTML(open("https://www.rtings.com/")))
    
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
        @title = article.css('a').text.strip
        @date = article.css('.pub-date').text
        @url = article.css("a").attribute('href').value
          @product = Product.all.find do |p|
          p.name == self.scrape_products[index]
          end
        review = Review.new(@title, @date, "https://www.rtings.com#{@url}", @product)
        review.save unless review.url.include?("youtu.be")
      end
    end  
  end
  
end