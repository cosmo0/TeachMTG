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
    data = get_card_data(card_name)
    image_tag = data.css('img[src^="http://magiccards.info/scans/"]')[0]
    image_tag.remove_attribute("width")
    image_tag.remove_attribute("height")
    image_tag.remove_attribute("style")
    return image_tag
  end

  # get the card's type(s)
  def get_card_infos(card_name)
    card_name.strip!
    #puts "Getting card type for #{card_name}"
    data = get_card_data(card_name)
    # card type is "Types — subtypes, mana cost (cmc)" just before the rules text
    card_infos = data.css('p.ctext')[0].previous_element.content.to_s

    # Attention, the "-" separator is not a standard dash !
    type_text = card_infos.split(",")[0].split("—")[0]
    type_text.strip!
    type_text.gsub!('Legendary ', '')
    type_text.gsub!('Basic ', '')
    type_text.gsub!('Snow ', '')
    type_text.gsub!('World ', '')

    # card mana cost
    cost = ""
    cmc = 0
    if card_infos.count(',') > 0
      cost_text = card_infos.split(",")[1]
      cost_regexp = /([\d\w\\\{\}]+) \(([\d]+)\)/i # cost under the form: XY (Z), XY being the cost and Z being the CMC
      cost = cost_regexp.match(cost_text)[1].to_s
      cmc = cost_regexp.match(cost_text)[2].to_i
    end

    return { name: card_name, type: type_text, cost: cost, cmc: cmc }
  end

  private

    # get all card infos
    def get_card_data(card_name)
      require 'open-uri'
      require 'uri'
      card_name = URI.encode(card_name)
      url = "http://magiccards.info/query?q=!#{card_name}&v=card&s=cname"
      Nokogiri::HTML(open(url))
    end

end
