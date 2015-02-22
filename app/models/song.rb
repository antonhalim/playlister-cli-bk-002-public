class Song

  @@songs = []
  attr_accessor :name, :genre, :artist

  def initialize
    @@songs << self
  end

  def genre= genre
    @genre = genre
    genre.songs << self
  end

  def to_s
    artist_name = self.artist.name
    genre = self.genre.name
    song_name = self.name
    "#{artist_name} - #{song_name} [#{genre}]"
  end

  def self.find_by_name(string)
      @@songs.each do |song|
        if song.name == string
          @song = song
        end
      end
      @song
  end

  def self.create_by_name(string)
      artist = Song.new
      artist.name = string
      artist
  end

  def self.count
    @@songs.length
  end

  def self.reset_all
    @@songs = []
  end

  def self.all
    @@songs
  end
end
