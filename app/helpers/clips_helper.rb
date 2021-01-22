module ClipsHelper
  def image_display(shop)
    if shop.images.attached?
      image_tag(shop.images[0].variant(resize:'136x136').processed, class:"shop-image")
    else
      image_tag("no_image.jpg", class:"shop-image")
    end
  end
end
