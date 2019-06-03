# require_relative './concerns_module.rb'

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
  
end #Song
