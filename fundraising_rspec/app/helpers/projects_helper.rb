module ProjectsHelper
  def date_status(project)
    if project.pledging_ends_on == nil
      "NIL"
    elsif project.expired?
      "All Done!"
    elsif project.ten_day_countdown?
      "#{project.count_remaining_days.to_i} Days Remaining!"
     elsif project.expires_today?
       "LAST DAY! Contribute Now!"
     else
     end #if
  end #date_status

  def image_for(project)
    if project.image_file_name.blank?
       image_tag("placeholder.png")   
     else 
        image_tag(project.image_file_name)
     end #if
  end #image_for(project)
    
    
end #ProjectsHelper
