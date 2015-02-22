require 'pry'
class LibraryParser

  def self.parse
     self.new.call
  end

  def files
    Dir.chdir("db/data/")
    musics_array = Dir.glob("*.mp3")
    Dir.chdir("../../")
    @musics_array = musics_array
  end

  def parse_filename(string)
    array = []
    array << string.split(" - ")[0]
    array << string.split(" - ")[1].gsub(/\s\[\w+(\-?\w+)?\].mp3/,"")
    array << string.match(/\w+(\-?\s?\w+)?\].mp3/)[0].gsub("].mp3","")
    array
  end

  def build_song(*parts)
    genre = Genre.create_by_name(parts[2])
    artist = Artist.create_by_name(parts[0])
    songs = Song.create_by_name(parts[1])
    songs.genre= genre
    songs.artist= artist
    songs
  end

  def call
    self.files.each do |music|
      self.build_song(*(self.parse_filename(music)))
    end
  end
end
