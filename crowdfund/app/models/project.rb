class Project < ActiveRecord::Base

  has_many :pledges, dependent: :destroy

  validates :name, presence: true
  
  validates :description, presence: true, length: { maximum: 500 }

  validates :target_pledge_amount, numericality: { greater_than: 0 }

  validates :website, format: {
    with: /https?:\/\/[\S]+\b/i,
    message: "must reference a valid URL"
  }
  
  validates :image_file_name, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  def self.accepting_pledges
    where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on asc")
  end

  def pledging_expired?
    pledging_ends_on < Date.today
  end

  def total_pledged
    pledges.sum(:amount) 
  end #total_pledged

  def met_goal?
      total_pledged >= target_pledge_amount
  end #met_goal?

  def balance_needed
    target_pledge_amount - total_pledged
  end #balance_needed
    

end #Project


# create_table "pledges", force: true do |t|
#     t.string   "name"
#     t.string   "email"
#     t.text     "comment"
#     t.decimal  "amount"
#     t.integer  "project_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.string   "city"
#   end

#   add_index "pledges", ["project_id"], name: "index_pledges_on_project_id"

#   create_table "projects", force: true do |t|
#     t.string   "name"
#     t.text     "description"
#     t.decimal  "target_pledge_amount"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.string   "website"
#     t.date     "pledging_ends_on"
#     t.string   "team_members"
#     t.string   "image_file_name"
#   end
