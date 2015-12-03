class Pledge < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user

  PLEDGE_AMOUNT = [25.00, 50.00, 100.00, 200.00, 500.00]
  validates :amount, inclusion: { in: PLEDGE_AMOUNT }

end #Pledge
