class NbaNewsProject::CLI
    attr_accessor :chosen_category
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
        #NbaNewsProject::Scraper.scrape_categories
    end

    def list_category
        @categories = []
        puts "Choose a category to see the latest news!"
        
        x = NbaNewsProject::Scraper.new.scrape_categories
        x.each_with_index do |category, index| 
            
            y = clean_categories(category)
            puts "#{index}. #{y}"
            @categories << y
        end
    end

    def clean_categories(category)
        
        x = category.children.text.split
        case x.size 
        when 1
            x.join(" ")
        when 2
            x.last
        when 3
            x.last
        when 4
            x.last(2).join(" ")
        when 5
            x.last(3).join(" ")
        end
    end

    def get_user_category
        puts "Select a category by number"
        chosen_category = gets.strip.to_i
        show_events_for(chosen_category) #if valid_input(chosen_category, @categories)
    end

    #def valid_input(input, data) #makes sure user input is valid
     #   input.to_i <= @data.length && input.to_i > 0
    #end

    def show_events_for(chosen_category)
        category = @categories[chosen_category]
        puts "Here are the latest news for #{category}"
    end
end
