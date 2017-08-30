class SearchController < ApplicationController
  def index
    render json: Station.find_all(params[:q])
  end
end
