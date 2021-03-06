module ShopsHelper
  # breadcrumbs用
  def search_word
    if @area.present?
      @area
    elsif @genre.present?
      @genre
    elsif @characteristic.present?
      @characteristic
    elsif @area_form.present?
      @area_form
    elsif @name_form.present?
      @name_form
    end
  end

  def search_result
    if @area.present?
      "#{@area}による検索結果 #{@search_shops_count}件"
    elsif @genre.present?
      "#{@genre}による検索結果 #{@search_shops_count}件"
    elsif @characteristic.present?
      "#{@characteristic}による検索結果 #{@search_shops_count}件"
    elsif @area_form.present?
      "#{@area_form}による検索結果 #{@search_shops_count}件"
    elsif @name_form.present?
      "#{@name_form}による検索結果 #{@search_shops_count}件"
    else
      "店舗一覧 #{Shop.all.count}件"
    end
  end

  def image_display(shop)
    if shop.images.attached?
      image_tag(shop.images[0].variant(resize:'136x136').processed, class:"shop-image")
    else
      image_tag("no_image.jpg", class:"shop-image")
    end
  end

end
