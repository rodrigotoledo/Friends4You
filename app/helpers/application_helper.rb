module ApplicationHelper
  def users_options_for_current
    users = User.order(:name).all.collect{|t| [t.name,t.id]}
    options_for_select(users,current_user.id)
  end
  
  def flash_messages
    output = []
    flash.each do |type,message|
      output << content_tag(:h4, message, :class => "alert_#{type}")
    end
    raw(output.join)
  end
end
