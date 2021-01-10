class NbaNewsProject::CLI
    def call
        puts "\nWelcome to NBA News\n"
        get_advertised_categories
        list_category
        get_user_category
        # get_events_for(category)
        # list_events
    end

    def get_advertised_categories
        #to be scraped instead
        @categories = ['  -  -  Signing Rumor','  -  -  Official Signing','  -  -  Trade Rumor','  -  -  Official Trade','  -  -  Misc Rumor','  -  -  Misc Official Transaction','  -  -  Rankings','  -  -  Suspension','  -  -  Injury','  -  -  NBA Draft','  -  -  Teams','  -  -  Expansion','  -  -  CBA','  -  -  Waiver','  -  -  All-Star','  -  -  Award','  -  -  Fines','  -  -  B-Ball IQ','  -  -  Summer League','  -  -  Preseason','  -  -  Playoffs']
    end

    def list_category
        puts "Choose a category to see the latest news!"
        @categories.each.with_index(1) do |category, index| 
        puts "#{index}. #{category}"
        end
    end

    def get_user_category
        chosen_category = gets.strip
        binding.pry
        # if valid_input(chosen_category.to_i, @categories)
        # end
    end

    def valid_input(input, data) #makes sure user input is valid
        input.to_i <= @data.length && input.to_i > 0
    end
end
