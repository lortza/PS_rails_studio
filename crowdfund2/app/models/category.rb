class Category < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :projects, through: :categorizations

  validates :name, presence: true, uniqueness: true
end #Category
