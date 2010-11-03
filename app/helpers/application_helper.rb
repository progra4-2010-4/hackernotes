module ApplicationHelper
  def title 
    base = "Hackernotes"
    if @title.nil? 
      base
    else
      "#{@title} | Hackernotes"
    end
  end
end
