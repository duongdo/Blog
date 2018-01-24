module ApplicationHelper
  def full_title page_title = ""
    title = t "name_project"
    if page_title.empty?
      title
    else
      page_title + " | " + title
    end
  end
end
