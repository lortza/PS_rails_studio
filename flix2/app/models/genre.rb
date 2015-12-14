class Genre < ActiveRecord::Base
  has_many :genrefications, dependent: :destroy
  has_many :movies, through: :genrefications
  
  before_validation :generate_slug

  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  def generate_slug
    self.slug ||= name.parameterize if name
  end #generate_slug

  def to_param
    slug
  end #to_param
  
end #Genre
