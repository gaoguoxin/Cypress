class Admin::AdminController < ApplicationController
	layout 'admin'
	before_action :require_sign_in

	def require_sign_in
		redirect_to login_url unless current_user.present?
	end

end