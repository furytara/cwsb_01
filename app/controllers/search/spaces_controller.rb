class Search::SpacesController < ApplicationController
  def index
    @addresses = Address.near(params[:search], 200)
    @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow address.venue.name
    end
    respond_to do |format| 
      format.html
      format.js
    end
  end

  def show
  end
end
