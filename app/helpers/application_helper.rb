module ApplicationHelper

  def login_or_logout
    if logged_in?
      "<li><a href='#'>Hello, #{current_user.name}!</a></li><li>#{link_to 'Your Topics & Posts', user_path(current_user)}</li><li>#{link_to "Log Out", logout_path}</li>".html_safe
    else
      "<li>#{link_to "Sign Up", signup_path}</li><li>#{link_to "Log In", login_path}</li>".html_safe
    end
  end

end
