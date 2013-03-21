class Artist < ActiveRecord::Base
  
  attr_accessible :param, :name, :about
  
  has_many :images
  has_many :tracks
  
end
