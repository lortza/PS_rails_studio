class Event < ActiveRecord::Base
  def free?
    price.zero? || price.blank?
  end #free?

  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end #self.upcoming
    
end #Event
