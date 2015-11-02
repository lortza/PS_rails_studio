class Movie < ActiveRecord::Base

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, allow_blank: true, format: {
      with: /\w+\.(gif|jpg|png)\z/i,
      message: "only GIF, JPG, and PNG are permitted"
    } #image_file_name
  validates :rating, inclusion: { in: RATINGS }


  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end #self.released
  
  def self.hits
    where('total_gross >= 300000000').order('total_gross desc')
  end #self.hits
  
  def self.flops
    where('total_gross < 10000000').order('total_gross asc')
  end #self.flops
  
  def self.recently_added
    order('created_at desc').limit(3)
  end #self.recently_added
  
  def flop?
    total_gross.blank? || total_gross < 50000000
  end #flop
end #Movie

# t.string   "title"
# t.string   "rating"
# t.decimal  "total_gross"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.text     "description"
# t.date     "released_on"
# t.string   "cast"
# t.string   "director"
# t.string   "duration"
# t.string   "image_file_name"
