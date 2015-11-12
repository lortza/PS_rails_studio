class Project < ActiveRecord::Base

  has_many :pledges, dependent: :destroy

  validates :name, presence: true
  validates :description, length: {minimum: 25, maximum: 500}
  validates :target_pledge_amount, numericality: { greater_than: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  } #image_file_name
  validates :website, allow_blank: true, format: { 
    with: /https?:\/\/[\S]+\b/i,
    message: "Whoops! Looks like this isn't a valid web address. Make sure to include the 'http://' or 'https://' and an ending like '.com' and try again."
   } #website


  def self.accepting_pledges
    where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on asc")
  end

  def pledging_expired?
    pledging_ends_on < Date.today
  end
end #Project

# t.string   "name"
# t.text     "description"
# t.decimal  "target_pledge_amount"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "website"
# t.date     "pledging_ends_on"
# t.string   "team_members"
# t.string   "image_file_name"
