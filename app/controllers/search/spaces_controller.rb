class Search::SpacesController < ApplicationController
  include GeneralHelper

  def index
    @addresses = Address.near params[:search], Settings.radius_search_in_miles
    @hash = mark_to_maps @addresses
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @space = Space.first
  end
end
