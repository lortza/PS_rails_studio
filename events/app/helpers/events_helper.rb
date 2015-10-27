module EventsHelper
  def format_price(event)
     if event.free? # since .free? could actaully have other factors to determine whether or not an event is free, this .free? will be defined in the model, not the helper. 
      # this is not event.price.free? because price will be called in the model
      #option 1:
      "<strong>Free!</strong>".html_safe
      #option2:
      content_tag(:strong, "Free!")
     else
      number_to_currency(event.price)
     end #if
  end #format_price

  def image_for(event)#this will generate the guts of the <%=  %>
    if event.image_file_name.blank?
      image_tag "placeholder.png"
    else
      image_tag event.image_file_name
    end #if
  end #image_for(event)
    
end #EventsHelper
