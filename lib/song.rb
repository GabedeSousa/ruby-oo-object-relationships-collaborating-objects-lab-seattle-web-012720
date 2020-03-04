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
    def self.new_by_filename(file)
        song_name = file.split(" - ")[1]
        artist = file.split(" - ")[0]
        # grab the string, which has an artist's name
        temp = Artist.new(artist)
        # create an instance of the artist class
        song = self.new(song_name)
        # creating an instance of the song class
        song.artist = temp
        # associate the song instance with the artist instance
        song
        # return the song object
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
    

end