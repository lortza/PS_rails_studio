class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :flight_date
      t.date :booking_date
      t.date :suggested_date

      t.timestamps null: false
    end
  end
end
