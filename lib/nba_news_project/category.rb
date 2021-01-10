class NbaNewsProject::Category
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @categories = NbaNewsProject::Category.all if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end