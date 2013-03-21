class Track < ActiveRecord::Base
  
  attr_accessible :name, :artist_id, :youtube_url
  
  belongs_to :artist
  
end
