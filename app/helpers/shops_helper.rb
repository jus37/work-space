module ShopsHelper
  def keyword
    if @area.present?
      "#{@area}による検索結果 #{@search_shops.count}件"
    elsif @genre.present?
      "#{@genre}による検索結果 #{@search_shops.count}件"
    elsif @characteristic.present?
      "#{@characteristic}による検索結果 #{@search_shops.count}件"
    elsif @area_form.present?
      "#{@area_form}による検索結果 #{@search_shops.count}件"
    elsif @name_form.present?
      "#{@name_form}による検索結果 #{@search_shops.count}件"
    end
  end
end
