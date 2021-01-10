class NbaNewsProject::Scraper
    attr_accessor :categories

    def scrape_categories
        doc = Nokogiri::HTML(open("https://basketball.realgm.com/nba/news"))

        categories = doc.css("select.ddl option")

        categories.each do |c|
            name = c.text
            NbaNewsProject::Category.new(name)
        end
    end
end