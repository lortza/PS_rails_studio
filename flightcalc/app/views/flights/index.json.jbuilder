json.array!(@flights) do |flight|
  json.extract! flight, :id, :flight_date, :booking_date, :suggested_date
  json.url flight_url(flight, format: :json)
end
