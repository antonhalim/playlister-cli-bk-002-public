require 'pry'

class Genre

  @@genre = []
  attr_accessor :artist, :name, :songs
  
  def initialize
    @songs = []
    @artists = []
    @@genre << self
  end

  def artists
    @artists
    @artists = @artists.uniq
  end

  def self.find_by_name(string)
    @@genre.each do |genre|
      if genre.name == string
        @genre = genre
      end
    end
    @genre
  end

  def self.create_by_name(string)
    genre = self.new
    genre.name = string
    genre
  end

  def self.count
    @@genre.length
  end

  def self.all
    @@genre
  end

  def self.reset_all
    @@genre = []
  end


end
