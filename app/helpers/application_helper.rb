module ApplicationHelper

  def valid_date(a_string)
    Date.parse(a_string)
  rescue
    Date.current
  end

end
