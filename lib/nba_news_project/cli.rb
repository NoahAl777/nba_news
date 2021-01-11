class NbaNewsProject::CLI
    require 'nokogiri'
    require 'open-uri'
    attr_accessor :chosen_category, :events
    def call
        puts "\nWelcome to NBA News\n"
        list_category
        get_user_category
        # get_events_for(category)
        # list_events
    end

    def list_category
        counter = 0
        @categories = []
        puts "Choose a category to see the latest news!"
        
        x = NbaNewsProject::Scraper.new.scrape_categories
        x.each do |category|
            y = clean_categories(category)
            @categories << y
        end

        @categories.shift(2)

        counter =0

        @categories.each_with_index do |category, index|
            counter += 1
            puts "#{index}. #{category}"

            if counter % 21 == 0
                break
            end
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
        @chosen_category = gets.strip.to_i
        show_events_for(@chosen_category)
    end

    def show_events_for(chosen_category)
        category = @categories[@chosen_category]        
        puts "Here are the latest news for #{category}"
        chosen_category = @chosen_category
        x = NbaNewsProject::Scraper.new.scrape_events(chosen_category, category)
        x.each_with_index do |event, index|
            puts event.children.text
            puts "-----------------"
        end
    end
end

