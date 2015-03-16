module ApplicationHelper

  def login_or_logout
    if logged_in?
      "Hello, #{current_user.name}! #{link_to "Log Out", logout_path}".html_safe
    else
      "#{link_to "Sign Up", signup_path} #{link_to "Log In", login_path} Log in to edit, delete, or claim your topics!".html_safe
    end
  end
end
