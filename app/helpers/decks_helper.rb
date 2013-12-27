module DecksHelper

  # is the current user admin ?
  def user_is_admin
    if current_user && current_user.email == ENV['ADMIN_EMAIL']
      true
    else
      false
    end
  end

  # get the card infos 
  def get_card_infos(card_name)
    require 'open-uri'
    require 'uri'

    # builds URL
    card_name = URI.encode(card_name)
    url = "http://magiccards.info/query?q=!#{card_name}&v=card&s=cname"

    # get data
    Nokogiri::HTML(open(url))
  end

end
