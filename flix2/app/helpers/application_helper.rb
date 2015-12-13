module ApplicationHelper

  def page_title
    if content_for?(:title)
      "Flix - #{content_for(:title)}"
       #"Flix - " + content_for(:title)
     else
       "Flix"
     end #if
  end #page_title

  def nav_link_to(text, url)
    classes = ['button']
    classes << 'active' if current_page?(url)
    link_to(text, url, class: classes.join(' '))
  end #nav_link_to
   
end #ApplicationHelper
