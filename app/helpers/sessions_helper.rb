module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # a ||= b (a || a = b)
    # if a is false, nil or undefined, then evaluate b
    # and set a to the result
  end

  def logged_in?
   !current_user.nil?
 end

 def log_out
    session.delete(:user_id)

  end

end
