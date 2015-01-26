class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  skip_before_filter :protect_from_forgery
  after_filter :set_csrf_cookie
  before_action :user_params if :devise_controller?  && (!@_request.nil? && @_request.fullpath == 'api/auth')

  def set_csrf_cookie
    if protect_against_forgery?
      cookies['XSRF-TOKEN'] = form_authenticity_token
    end
  end
  protected
  def user_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :firstname, :lastname, :email, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.for(:user_registration){ |u| u.permit(:username, :confirm_success_url, :config_name, :registration, :email, :password)}
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
