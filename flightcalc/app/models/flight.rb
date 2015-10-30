class Flight < ActiveRecord::Base
  def calculate_flight_date(flight)
    flight.suggested_date = flight.booking_date + 5.days
    flight.booking_date
  end #calculate_flight_date

  def calculate_purchase_date(flight)
     flight.suggested_date = flight.flight_date - 5.days
  end #calculate_purchase_date
     
end #Flight

    # t.date     "flight_date"
    # t.date     "booking_date"
    # t.date     "suggested_date"


# 57 domestic
# 171 international

# cool. well, the bad news is that dates and times can be pretty damn complicated. the good news is that just calculating a distance of days is super easy, like 57.days.ago. here's a helpful post: http://stevenyue.com/2013/03/23/date-time-datetime-in-ruby-and-rails/.