class  CLI

    def call
        puts " "
        puts "Welcome to RTINGS."
        puts " "
        main_menu
        goodbye
    end

    def main_menu

      puts <<-DOC
            Enter 1 for Televisions
            Enter 2 for Monitors
            Enter 3 for Headphones
            Or type exit
      DOC
      selection
    end

    def selection
      input = nil
      while input != "exit".strip.downcase

        input = gets.strip.downcase

          case input
          when "1"
            a = Product.new("Televisions")
            a.choice
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