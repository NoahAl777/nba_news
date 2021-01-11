class NbaNewsProject::Category
    @@all = []

    attr_accessor :name, :title
    attr_writer :events

    def initialize(name)
        @name = name
        @title = title
        @events = []
        save
    end

    def self.all
        NbaNewsProject::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def events
        NbaNewsProject::Scraper.scrape_events(self) if @events.empty?
        @events
        #binding.pry
    end

    def save
        @@all << self
    end
end