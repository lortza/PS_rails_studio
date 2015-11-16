class Event < ActiveRecord::Base

  has_many :registrations, dependent: :destroy

  validates :name, :location, presence: true
  validates :description, length: {minimum: 25}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  } # the "with" is a ruby regular expression


  def free?
    price.zero? || price.blank?
  end #free?

  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end #self.upcoming

  def spots_left
    capacity - registrations.size 
  end #spots_left

  def sold_out?
    spots_left.zero?
  end #sold_out?
    
end #Event

    # t.string   "name"
    # t.string   "location"
    # t.decimal  "price"
    # t.datetime "created_at",                  null: false
    # t.datetime "updated_at",                  null: false
    # t.datetime "starts_at"
    # t.text     "description"
    # t.string   "image_file_name"
    # t.integer  "capacity",        default: 1

    