require 'bundler'
Bundler.require

module Concerns
   module Findable
    def self.find_by_name(name)
      @@all.find { |e| e.name == name }    
    end
  end #Findable
end

require_all 'lib'
