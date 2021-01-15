class TopsController < ApplicationController
  def index
    @shops_count = Shop.all.count
    @top_genres = Genre.limit(5)
    @genres = Genre.all
    @top_areas = Area.limit(5)
    @areas = Area.all
    @top_characteristics = Characteristic.limit(5)
    @characteristics = Characteristic.all
  end
end
