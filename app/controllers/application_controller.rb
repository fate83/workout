class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  protected
  def authenticate
    unless session[:user_id]
      @current_user ||= User.find_by(auth_token: params[:token])
      if @current_user.nil?
        render_unauthorized
      else
        session[:user_id] = @current_user.id
      end
    else
      @current_user = User.find_by(id: session[:user_id]) || render_unauthorized
    end
  end

  def render_unauthorized
    #self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Forbidden', status: :forbidden
  end
end
