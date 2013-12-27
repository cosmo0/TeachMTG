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
    image_tag = data.css('img[id*="MainContent_SubContent_SubContent_cardImage"]')[0]
    image_tag.remove_attribute("id")
    image_tag.remove_attribute("style")
    image_tag['src'] = image_tag['src'].gsub("../../", "http://gatherer.wizards.com/")
    return image_tag
  end

  # gets the card's type
  def get_card_type(card_name)
    data = get_card_infos(card_name)
    type_tag = data.css('div[id*="MainContent_SubContent_SubContent_typeRow"] div.value')[0].content
    puts type_tag
    return type_tag
  end

  private

    # get all card infos
    def get_card_infos(card_name)
      require 'open-uri'
      gatherer_name = ""
      card_name.split(' ').each do |n|
        gatherer_name += "+[#{n}]"
      end
      puts gatherer_name
      url = "http://gatherer.wizards.com/Pages/Search/Default.aspx?name=#{gatherer_name}"
      Nokogiri::HTML(open(url))
    end

end
