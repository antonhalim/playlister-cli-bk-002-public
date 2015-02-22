require 'pry'
  class Artist

  @@artist = []

  def initialize
    @songs = []
    @genres = []
    @@artist << self
  end

  def self.reset_all
    @@artist = []
  end

  def name= name
    @name = name
  end

  def name
    @name
  end

  def self.all
    @@artist
  end

  def self.count
    @@artist.length
  end

  def self.find_by_name(string)
    @@artist.each do |artist|
      if artist.name.include?(string)
        @result = artist
      end
    end
    @result
  end

  def self.create_by_name(string)
      artist = Artist.new
      artist.name = string
      artist
  end

  def add_song(song)
    @songs << song
    song.artist = self
    if song.genre != nil
      @genres << song.genre
      song.genre.artists << self
    end
  end

  def add_songs(array)
    array.each do |song|
      @songs << song
      if song.genre != nil
        @genres << song.genre
        song.genre.artists << self
      end
    end
  end

  def songs
    @songs
  end

  def genres
    @genres
  end

end
