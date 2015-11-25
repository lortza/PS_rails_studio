class Pledge < ActiveRecord::Base
  belongs_to :project

  validates :name, :email, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  PLEDGE_AMOUNT = [25.00, 50.00, 100.00, 200.00, 500.00]
  validates :amount, inclusion: { in: PLEDGE_AMOUNT }

end #Pledge
