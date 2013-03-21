class Image < ActiveRecord::Base
  
  attr_accessible :artist_id, :url
  
  belongs_to :artist
  
end
