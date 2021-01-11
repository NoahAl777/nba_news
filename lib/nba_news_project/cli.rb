class NbaNewsProject::CLI
    attr_accessor :chosen_category, :events
    def call
        puts "\nWelcome to NBA News\n"
        list_category
        categories_and_events
        #get_user_category
        # get_events_for(category)
        # list_events
    end

    def list_category
        counter = 0
        puts "Choose a category to see the latest news!"
        
        NbaNewsProject::Scraper.new.scrape_categories
        #after line 16 you now have all of the category objects
        @categories = NbaNewsProject::Category.all

        @categories.shift(2)

        counter =0

        @categories.each_with_index do |category, index|
            counter += 1
            puts "#{index}. #{category.name}"

            if counter % 21 == 0
                break
            end
        end
    end

def categories_and_events
    def get_user_category
        puts "Select a category by number"
        @chosen_category = gets.strip.to_i
        if @chosen_category < 21
            show_events_for(@chosen_category)
        else 
            puts "Please select a number less than 21"
            return get_user_category
        end
    end
    #Create a way to avoid re scraping for info already obtained
    #save events inside of categories
    #Setup object attributes
    def show_events_for(chosen_category)
        category = @categories[@chosen_category]        
        puts "Here are the latest news for #{category.name}"
        chosen_category = @chosen_category
        x = NbaNewsProject::Scraper.new.scrape_events(chosen_category, category)
        #binding.pry
        category.events.each_with_index do |event, index|
            puts "#{index + 1}. #{event}"
            puts "-----------------"
        end
    end
    def more
        puts "Would you like to select another category? y/n"
        response = gets.to_s.strip
        if response == "y"
            puts "What category would you like to see?"
            categories_and_events
        elsif response == "n"
            puts "Thank you for exploring NBA News!"
        else
            puts "invalid response"
            more
        end
    end
    get_user_category
    more
    # case response
    # when response == "y"
    #     puts "more categories"
    #     get_user_category
    # when response == "n"
    #     puts "Thank you for exploring NBA News!"
    # end
end
end

