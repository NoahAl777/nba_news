class NbaNewsProject::scraper
    def scrape_categories
        doc = Nokogiri::HTML(open("https://basketball.realgm.com/nba/news"))
        binding.pry
    end
end