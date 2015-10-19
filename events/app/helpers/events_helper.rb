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
    
end #EventsHelper
