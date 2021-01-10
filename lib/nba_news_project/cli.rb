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
        NbaNewsProject::Category.new("signing rumors")
        NbaNewsProject::Category.new("official signing")
        @categories = NbaNewsProject::Category.all
    end

    def list_category
        puts "Choose a category to see the latest news!"
        @categories.each.with_index(1) do |category, index| 
        puts "#{index}. #{category.name}"
        end
    end

    def get_user_category
        chosen_category = gets.strip.to_i
        show_events_for(chosen_category) #if valid_input(chosen_category, @categories)
    end

    #def valid_input(input, data) #makes sure user input is valid
     #   input.to_i <= @data.length && input.to_i > 0
    #end

    def show_events_for(chosen_category)
        category = @categories[chosen_category - 1]
        puts "Here are the latest news for #{category.name}"
    end
end
