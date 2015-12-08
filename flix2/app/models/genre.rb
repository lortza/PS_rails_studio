class Genre < ActiveRecord::Base
  has_many :genrefications, dependent: :destroy
  has_many :movies, through: :genrefications
  
  validates :name, presence: true, uniqueness: true
end #Genre
