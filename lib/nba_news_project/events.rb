class NbaNewsProject::Events
    @@all = []
    attr_accessor :name, :category, :key_info
    def initialize(name, event)
        @name = name
        @events = events
        save
    end

    

    def save
        @@all << self
    end
end