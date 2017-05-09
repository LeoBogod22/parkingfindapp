class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception





  def sign_up_params


  devise_parameter_sanitizer.sanitize(:sign_up)
end
end
