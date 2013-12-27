module DecksHelper

  # is the current user admin ?
  def user_is_admin
    if current_user && current_user.email == ENV['ADMIN_EMAIL']
      true
    else
      false
    end
  end

  # get the card's image tag
  def get_card_image(card_name)
    data = get_card_infos(card_name)
    image_tag = data.css('img[src^="http://magiccards.info/scans/"]')[0]
    image_tag.remove_attribute("width")
    image_tag.remove_attribute("height")
    image_tag.remove_attribute("style")
    return image_tag
  end

  def get_card_type(card_name)
    data = get_card_infos(card_name)
    
  end

  private

    # get all card infos
    def get_card_infos(card_name)
      require 'open-uri'
      require 'uri'
      card_name = URI.encode(card_name)
      url = "http://magiccards.info/query?q=!#{card_name}&v=card&s=cname"
      Nokogiri::HTML(open(url))
    end

end
