class NbaNewsProject::Scraper

    def scrape_categories
        doc = Nokogiri::HTML(open("https://basketball.realgm.com/nba/news"))

        categories = doc.css("select.ddl option")

        categories.each do |c|
            name = c.text.gsub("  -  ","").gsub("-  ","")
            
            NbaNewsProject::Category.new(name)
        end
    end

    def scrape_events(number, category)
        x = 16 + number
        #binding.pry
        doc = Nokogiri::HTML(open("https://basketball.realgm.com/news/wiretap/tags/#{x}/NBA_#{category.name.tr(' ','-')}"))
        
        events = doc.css("a.article-title")

        events.each do |e|
            title = e.text
            #binding.pry
            category.events << title
        end
    end

    #make method with .tr or .gsub or regex to replace spaces for "-"
end