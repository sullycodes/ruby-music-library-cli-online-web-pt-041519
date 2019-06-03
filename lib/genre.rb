require_relative './concerns_module.rb'

class Genre

	@@all = []

  extend Concerns::Findable

	
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
    genre = Genre.new(name) 
    genre.save
    genre
  end
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    # if song.genre == nil
    @songs << song
    # song.genre = self
    # end
  end
  
  def artists 
    artists  = []
    @songs.each do |e|
      artists  << e.artist
    end
    artists.uniq
  end
  
end #Genre