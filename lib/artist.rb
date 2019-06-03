require_relative './concerns/concerns_module.rb'
# require '/config/environment.rb'


class Artist 
  extend Concerns::Findable

	@@all = []
	
	attr_accessor :name

	def initialize(name)
		@name = name
		@songs = []
		self.save
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
    artist = Artist.new(name) 
    artist.save
    artist
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
    @songs << song
    song.artist = self
    end
  end
  
  def genres 
    genres = []
    @songs.each do |e|
      genres << e.genre
    end
    genres.uniq
  end

end #Artist