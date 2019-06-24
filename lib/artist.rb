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
  
  # NEED TO FIX!!! #add_song does not add the song to the current artist's collection of songs if it already exists therein
  def add_song(song)
    # if !self.songs.include?(song) && song.artist == nil
    if !@songs.include?(song)
    @songs << song
    song.artist = self unless song.artist == self
    end
  end
  
  def genres 
    # genres = []
    # @songs.each do |e|
    #   genres << e.genres
    # end
    # genres.uniq
    self.songs.map{ |s| s.genre }.uniq 
  end

end #Artist