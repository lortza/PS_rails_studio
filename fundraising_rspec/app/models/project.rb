class Project < ActiveRecord::Base
  def expired?
    #Date.parse(pledging_ends_on).past? #this does not work
    pledging_ends_on < Time.now && pledging_ends_on != Date.today
  end #expired?

  def count_remaining_days
    days = pledging_ends_on - Date.today
    days 
  end #count_remaining_days

  def ten_day_countdown?
    #if the date is 10 days away or less 
    pledging_ends_on <= 10.days.from_now && pledging_ends_on != Date.today
  end #ten_day_countdown?

  def expires_today?
    pledging_ends_on == Date.today 
  end #expires_today?

  def self.accepting_pledges
     where("pledging_ends_on >= ?", Date.today)
  end #accepting_pledges
    
    
    
end #Project
