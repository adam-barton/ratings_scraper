class  CLI

    def call
      Scraper.scrape_products
      Scraper.scrape_reviews
        puts " "
        puts "Welcome to RTINGS."
        puts " "
        main_menu
        goodbye
    end

    def main_menu

      puts <<-DOC
            Enter "t" for Televisions
            Enter "m" for Monitors
            Enter "h" for Headphones
            Or type exit
      DOC
      selection
    end

    def selection
      input = nil
      while input != "exit".strip.downcase
        input = gets.strip.downcase

          case input
          when "t"
           a = Product.find_by_name("Televisions")
           a.reviews
  
            # a = Product.new("Televisions")
            # a.choice
          when "2"
            a = Product.new("Monitors")
            a.choice
          when "3"
            a = Product.new("Headphones")
            a.choice
          when "menu"
            main_menu
          # else
          #   puts "Please make a valid selection"
          end
      end
    end

    def goodbye
      puts "Thanks for visiting. See you next time."
    end
end