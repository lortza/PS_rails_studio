require "date"
flight_date = Date.parse("26/03/2015")
purchase_date = Date.parse("23/03/2015")

# puts flight_date.to_i - purchase_date.to_i

# puts Time.now + 5.days

#cool. well, the bad news is that dates and times can be pretty damn complicated. the good news is that just calculating a distance of days is super easy, like 57.days.ago. here's a helpful post: http://stevenyue.com/2013/03/23/date-time-datetime-in-ruby-and-rails/.