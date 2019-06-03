# require_relative './concerns/concerns_module.rb'

class Song
  # extend Concerns::Findable

	@@all = []
	
	attr_accessor :name, :artist, :genre

	def initialize(name, artist = nil, genre = nil)
		@name = name
		@artist = artist
		@genre = genre

		if artist != nil
		  self.artist = @artist
		  self.artist.songs << self
		end
		if genre != nil
		  self.genre = @genre
		  self.genre.songs << self
		end
	end
	
	def artist=(artist)
	  @artist = artist
	  artist.add_song(self)
	end
	
	def genre=(genre)
	 if genre.songs.include?(self)
	 else
	  @genre = genre
	  genre.add_song(self)
	 end
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
	  @@all.clear
	end
	
	def save
	  @@all << self
	end

  def self.create(name)
    song = Song.new(name) 
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find { |e| e.name == name }    
  end
  
  def self.find_or_create_by_name(name)
   self.find_by_name(name) ||  self.create(name)
  end
  
  
  # ("Thundercat - For Love I Come - dance.mp3")
  def self.new_from_filename(file_name)
      arr = file_name.split(/[-]+/)
      arr.each {|e| e.strip!}
      artist = arr.first
      name = arr[1]
      genre = arr.last.gsub( /.{4}$/, '' ) #cuts off the ".mp3" from dance
      song = Song.new(name)
      if artist != nil
      song.artist = Artist.find_or_create_by_name(artist)
      end
      if genre != nil
      song.genre = Genre.find_or_create_by_name(genre)
      # song.artist.add_song(song)
      end
      song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end
  
end #Song
