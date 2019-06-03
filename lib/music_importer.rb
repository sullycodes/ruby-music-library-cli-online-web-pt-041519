class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    @mp3s = []
  end
  
  #use this link to understand how .files works: https://ruby-doc.org/core-2.5.1/Dir.html
  def files
  # Dir.glob("*.mp3") #this grabs mp3s from path
    Dir.chdir(@path) do     
      @mp3s = Dir.glob("*.mp3")  
    end
  end
  
  # send filename into importer which will convert into a song and artist instance via .create_from_filename
  def import
    files.each do |e|
      Song.create_from_filename(e)
    end
  end

end #Importer
