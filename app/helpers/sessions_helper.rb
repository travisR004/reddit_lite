module SessionsHelper
  def login!
    session[:session_token] = @user.reset_session_token!
  end

  def current_user
    if session[:session_token]
      @current_user ||= User.find_by_session_token(session[:session_token])
    end
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end
end
