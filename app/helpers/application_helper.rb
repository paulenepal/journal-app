module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%b %d %I:%M%P") unless datetime.nil?
    end
end
