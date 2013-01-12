module ApplicationHelper
  def parse_link(text)
    text = text.gsub(/(http.+?)\.(png|jpg|jpeg)/) do |str|
      image_tag(str)
    end
    skip_tags = ["a", "pre", "code", "kbd", "script", "img"]
    Rinku.auto_link(text, nil, nil, skip_tags)
  end
end
