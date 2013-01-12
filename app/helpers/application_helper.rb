module ApplicationHelper
  def parse_link(text)
    Rinku.auto_link(text)
  end
end
