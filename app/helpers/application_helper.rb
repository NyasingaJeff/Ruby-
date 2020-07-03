module ApplicationHelper
    def gravatar_for(user , options= {size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)  #digest the user email since its transimitted in MD5 hash formatt
        size=options[:size] #defininf the size ... if the user provided else use default
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" #actual getting of the gravatar pik
        image_tag(gravatar_url,alt: user.name, class: "gravatar")#displaying the pik
    end
end
