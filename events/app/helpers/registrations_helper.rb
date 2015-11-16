module RegistrationsHelper

  def register_link(event)
    if event.sold_out? # sold_out is in model
      content_tag(:strong, "Sold Out!") 
    else
      link_to "Register!", new_event_registration_path(event), class: "button ok register" 
    end #if
  end #register_link
    
end #RegistrationsHelper
