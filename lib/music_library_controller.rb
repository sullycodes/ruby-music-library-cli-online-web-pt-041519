require 'pry'

class MusicLibraryController


	def initialize(path = "./db/mp3s")
		import = MusicImporter.new(path)
		import.import
	end
	
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    4.times do
      user_input = gets.chomp
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by { |e| e.name }
    sorted_songs.each_with_index do |e, i|
      puts "#{i+1}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by { |e| e.name }
    sorted_artists.uniq.each_with_index do |e, i|
      puts "#{i+1}. #{e.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort_by { |e| e.name }
    sorted_genres.uniq.each_with_index do |e, i|
      puts "#{i+1}. #{e.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    # artist = Artist.all.find { |e| user_input == e.name }
    Artist.all.each do |e|  
      if e.name == user_input
        puts e.songs
      end
    end
  end

end #MusicLibraryController
