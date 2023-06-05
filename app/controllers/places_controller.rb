class PlacesController < ApplicationController
  before_action :check_user, except: [:index]
  def index
    @places = Place.all
  end

    
 
  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user["id"]})
  end
  


  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end


  private

  def check_user
    redirect_to "/" unless @current_user || request.path == "/"
  end

end
