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
    
      input = gets.strip
    
      @selected = Product.all[input.to_i - 1]
        
        if input.to_i > Product.all.count || input.to_i < 1
          puts "I don't understand, try again."
          sleep 1
          main_menu
        else        
          puts "#{@selected.name}, good choice."
          puts "Here are the latest reviews:"
          puts " "
          puts " "
         
          Whirly.configure spinner: "dots"
          Whirly.start do
            Whirly.status = "LOADING..."
            sleep 3
          end
        
        Scraper.scrape_reviews

        list_reviews(@selected)

        puts " "
        puts "Enter the number of the review you'd like to read, or type exit."
        puts " "

        input = gets.strip.downcase

        if input.to_i.between?(1, 5)
          open_review(input.to_i - 1)
        elsif input.to_i > 5
          puts "I don't understand. Try again"
          sleep 1 
           main_menu
        elsif input == "exit"
          goodbye
        else
        puts "I don't understand. Try again"
        puts " "
        main_menu
        end
      end
    end

    def list_reviews(product)
      Product.list_reviews(product)
    end
    
    def open_review(review)
      begin
       Launchy.open(@selected.reviews[review].url)
      rescue
       puts"#{@selected.reviews[review].url}"
      end
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
