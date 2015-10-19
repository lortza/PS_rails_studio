module ProjectsHelper
  def date_status(project)
    if project.pledging_ends_on == nil
      "NIL"
    elsif project.expired?
      "EXPIRED"
    elsif project.ten_day_countdown?
      "#{project.count_remaining_days.to_i} Days Remaining!"
     elsif project.expires_today?
       "LAST DAY! Contribute Now!"
     else
     end #if
  end #date_status
    
end #ProjectsHelper
