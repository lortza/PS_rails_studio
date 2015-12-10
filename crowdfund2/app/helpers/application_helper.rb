module ApplicationHelper 

  def page_title
    if content_for?(:title)
       "Crowdfund - " + content_for(:title)
     else
       "Crowdfund"
     end 
  end #page_title
    
    
end #ApplicationHelper
