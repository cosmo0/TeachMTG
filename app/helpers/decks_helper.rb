# encoding: utf-8

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

  # get the card's type(s)
  def get_card_type(card_name)
    #puts "Getting card type for #{card_name}"
    data = get_card_infos(card_name)
    # card type is "Types — subtypes, mana cost" just before the rules text
    # Attention, the "-" separator is not a standard dash !
    type_text = data.css('p.ctext')[0].previous_element.content.to_s.split(",")[0].split("—")[0]
    type_text.strip!
    type_text.gsub!('Legendary ', '')
    type_text.gsub!('Basic ', '')
    type_text.gsub!('Snow ', '')
    type_text.gsub!('World ', '')
    #puts "Card types found : #{type_text}"

    return type_text
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
