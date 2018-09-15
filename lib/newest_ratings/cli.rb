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
      selection
    end

    def selection
      input = nil
      while input != "exit".strip.downcase
        input = gets.strip.downcase

          case input
          when "1"
            @current_selection = Product.all[0]
            puts "#{@current_selection.name}, good choice."
            puts "Here are the latest reviews:"
              Scraper.scrape_reviews
             Product.list_reviews(@current_selection)
            # @current_reviews
            second_menu
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
    
    def second_menu
      input = nil
      puts " "
      puts "select the review you'd like to read, or exit to go back to the main menu."

      input = gets.strip.downcase
      
        case input
        when "exit"
          Review.clear
          Product.current_reviews.clear
          main_menu
         else 
           @current_selection.reviews.each.with_index do |review, index|
             input == index +1 
             review
         end
             
        #   Review.all.each.with_index do |r, index|
        #     r.product == 
      end
    end

    def goodbye
      puts "Thanks for visiting. See you next time."
    end
end