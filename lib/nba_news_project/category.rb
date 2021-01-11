class NbaNewsProject::Category
    @@all = []

    attr_accessor :name, :events

    def initialize(name)
        @name = name
        @events = []
        save
    end

    def self.all
        NbaNewsProject::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end