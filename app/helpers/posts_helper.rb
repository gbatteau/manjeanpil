module PostsHelper
  
  def special_type(special_type)
    if special_type == "Lunch"
      content_tag :span, "#{special_type}", class: "tag is-primary"
    elsif special_type == "Happy-Hour"
      content_tag :span, "#{special_type}", class: "tag is-link"
    elsif special_type == "Dinner"
      content_tag :span, "#{special_type}", class: "tag is-warning"
    else
      ""
    end
  end
    
    
end
