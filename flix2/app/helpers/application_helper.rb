module ApplicationHelper

  def page_title
    if content_for?(:title)
      "Flix - #{content_for(:title)}"
       #"Flix - " + content_for(:title)
     else
       "Flix"
     end #if
  end #page_title
   
end #ApplicationHelper
