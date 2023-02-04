module ApplicationHelper
  def description_truncate(description)
    description.length >= 100 ? description.first(97) + "..." : description
  end
end
