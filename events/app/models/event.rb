class Event < ActiveRecord::Base
  def free?
    price.zero? || price.blank?
  end #free?
end #Event
