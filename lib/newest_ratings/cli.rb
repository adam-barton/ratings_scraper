class  CLI

    def call
      Scraper.start
        puts " "
        puts "Welcome to RTINGS."
        puts " "
        main_menu
        goodbye
    end

    def main_menu
      puts "Please make a selection:"
      puts " "
      Product.list_products
      puts " "
      puts "Or type exit"
      
      # <<-DOC
      #       Enter "t" for Televisions
      #       Enter "m" for Monitors
      #       Enter "h" for Headphones
      #       Or type exit
      # DOC
      selection
    end

    def selection
      input = nil
      while input != "exit".strip.downcase
        input = gets.strip.downcase

          case input
          when "1"
            puts "#{Product.all[0].name}, good choice."
            puts "Here are the latest reviews:"
              Scraper.scrape_reviews
           Review.list_reviews_by_product(Product.all[0].name)
            
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