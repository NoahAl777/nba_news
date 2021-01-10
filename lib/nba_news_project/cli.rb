class NbaNewsProject::CLI
    def call
        puts "Welcome to NBA News"
        get_advertised_categories
        get_user_category
        # get_events_for(category)
        # list_events
    end

    def get_advertised_categories
        #to be scraped instead
        @categories = ['  -  -  Signing Rumor','  -  -  Official Signing','  -  -  Trade Rumor','  -  -  Official Trade','  -  -  Misc Rumor','  -  -  Misc Official Transaction','  -  -  Rankings','  -  -  Suspension','  -  -  Injury','  -  -  NBA Draft','  -  -  Teams','  -  -  Expansion','  -  -  CBA','  -  -  Waiver','  -  -  All-Star','  -  -  Award','  -  -  Fines','  -  -  B-Ball IQ','  -  -  Summer League','  -  -  Preseason','  -  -  Playoffs']
    end

    def get_user_category
        #list categories
        @categories.each_with_index do |category, index| 
        puts "#{index + 1}. #{category}"
    end
    end
end
