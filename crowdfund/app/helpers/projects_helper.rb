module ProjectsHelper
  def format_pledging_ends_on(project)
    if project.pledging_expired?
      content_tag(:strong, 'All Done!')
    else
      distance_of_time_in_words(Date.today, project.pledging_ends_on) + " remaining"
    end #if
  end #format_pledging_ends_on

  def image_for(project)
    if project.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag project.image_file_name
    end #if
  end #image_for

  def format_funding_status(project)
    if project.met_goal?
       content_tag(:strong, 'Success! This project has met its goal!')
     elsif project.met_goal? == false && project.pledging_expired? == false
      "There's still time! Only " + number_to_currency(project.balance_needed)+ " to go!"
     else
      "FAIL"
     end #if
  end #format_funding_status
    
end #ProjectsHelper
