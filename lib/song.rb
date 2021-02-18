require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        splits = file_name.split(" - ")
        song = Song.new(splits[1])
        song.artist_name = splits[0]
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end