class SearchController < ApplicationController
  def index
    @zip = params[:q]
    @stations = Station.find_all(params[:q])
  end
end
