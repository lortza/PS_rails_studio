module ApplicationHelper
    def page_title
      if content_for?(:title)
        "EventApp - #{content_for(:title)}" 
      else
        "EventApp"
      end #content_for
    end #page_title
      
end #ApplicationHelper
