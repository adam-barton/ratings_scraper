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
      puts "Or type exit to leave"
      @products = Product.all
    #   selection
    # end

    # def selection
      input = nil
      while input != "exit".strip.downcase
    #     input = gets.strip.downcase

    #       case input
    #       when "1"
    #         @current_selection = Product.all[0]
    #         puts "#{@current_selection.name}, good choice."
    #         puts "Here are the latest reviews:"
    #           Scraper.scrape_reviews
    #         Product.list_reviews(@current_selection)
    #         # @current_reviews
    #         second_menu
    #       when "2"
    #         Launchy.open("https://www.rtings.com/")
    #       when "3"
    #         a = Product.new("Headphones")
    #         a.choice
    #       when "menu"
    #         main_menu
    #       # else
    #       #   puts "Please make a valid selection"
    #       end
    #   end
    # end
    
    input = gets.strip.downcase
        @selected = Product.all[input.to_i - 1]
        puts "#{@selected.name}, good choice."
        puts "Here are the latest reviews:"
        Scraper.scrape_reviews

        list_reviews(@selected)

        puts " "
        puts "Enter the number of the review you'd like to read, or type exit to go back to the main menu."
        puts " "

        input = gets.strip.downcase

        if input.to_i > 0 
          open_review(input.to_i - 1)
        
        # elsif input == "exit"
        # exit

        else
        puts "I don't understand. Try again"
        end
     end
   end

    def list_reviews(product)
      Product.list_reviews(product)
    end
    
    def open_review(review)
      Launchy.open("@selected.reviews[review].url")
      puts "Would you like to see make another selection? y/n"
      
      input = gets.strip.downcase
      
      case input
      when "y"
      main_menu
      when "n"
      goodbye
    end
        

    def goodbye
      puts "Thanks for visiting. See you next time."
      exit
    end
end
