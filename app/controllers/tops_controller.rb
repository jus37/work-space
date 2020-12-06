class TopsController < ApplicationController
  def index
    @top_genres = Genre.limit(5)
    @genres = Genre.all
    @top_areas = Area.limit(5)
    @areas = Area.all
    @top_characteristics = Characteristic.limit(5)
    @characteristics = Characteristic.all

  end
end
