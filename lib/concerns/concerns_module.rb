# it cannot be used just like the original in Song.rb....
#   def self.find_by_name(name)
  #   @@all.find { |e| e.name == name }    
  # end

# because if you use @@all, it is hard-coding a reference w/in that module

# However, using self allows the program to see whatever self happens to be

# In the case of modules, self will refer to whatever class you are extending that module into

# you also need to eliminate the self from self.find_by_name because extend already tells th module it is a class method

module Concerns
  
  module Findable
  
    def find_by_name(name)
      self.all.find { |e| e.name == name }    
    end
  
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  
  end #Findable
  
end #Concerns
