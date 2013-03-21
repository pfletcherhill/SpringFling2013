class ArtistsController < ApplicationController
  
  def index
    @artists = Artist.all
    render json: @artists.to_json(:include => [:images, :tracks])
  end
  
  def home
    @artists = Artist.all
  end
    
end
