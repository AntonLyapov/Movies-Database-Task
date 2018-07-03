class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def authenticate_logged_user!
		return if user_signed_in?

		# flash[:alert] = "Please logged in"
		# redirect_back fallback_location: root_path
		redirect_to new_user_session_path, notice: 'Please logged in'
	end

	def require_admin_user!
		return if user_signed_in? && (current_user.admin? || current_user.moderator?)

		#flash[:alert] = "Not have permissions"
		#redirect_back fallback_location: root_path
		redirect_to root_path, notice: 'Not have permissions.'
	end

	# def authenticate_admin_user!
	# 	return if user_signed_in? && current_user.admin?

	# 	flash[:alert] = "Not have permissions"
	# 	redirect_back fallback_location: root_path
	# end

	# def authenticate_moderator_user!
	# 	return if user_signed_in? && current_user.admin?

	# 	flash[:alert] = "Not have permissions"
	# 	redirect_back fallback_location: root_path
	# end
end
