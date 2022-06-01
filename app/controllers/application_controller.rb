class ApplicationController < ActionController::API
  include ActionController::Helpers
	# protect_from_forgery with: :exception
  # protect_from_forgery
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false
  helper_method :current_user, :user_signed_in?
end
