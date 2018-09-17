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
      @products = Product.all
    #   selection
    # end

    # def selection
      # input = nil
      # while input != "exit".strip.downcase
    #     input = gets.strip.downcase
    
    input = gets.strip.downcase
    
        @selected = Product.all[input.to_i - 1]
        
        if input.to_i > Product.all.count
          puts "I don't understant, try again."
          puts "----------------------------------"
          main_menu
      else        
        puts "#{@selected.name}, good choice."
        puts "Here are the latest reviews:"
        Scraper.scrape_reviews

        list_reviews(@selected)

        puts " "
        puts "Enter the number of the review you'd like to read."
        puts " "

        input = gets.strip.downcase

        if input.to_i.between?(1, 5)  
          open_review(input.to_i - 1)
          
        elsif input.to_i > 5
          puts "I don't understand. Try again"
          sleep(1)
          main_menu
        else
        puts "I don't understand. Try again"
      end
      end
    end

    def list_reviews(product)
      Product.list_reviews(product)
    end
    
    def open_review(review)
      puts"#{@selected.reviews[review].url}"
      puts " "
      puts " "
      puts "Would you like to see make another selection? y/n"
      
      input = gets.strip.downcase
      
      case input
      when "y"
      main_menu
      when "n"
      goodbye
      end
    end
        

    def goodbye
      puts "Thanks for visiting. See you next time."
      exit
    end
end
