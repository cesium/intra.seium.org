class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	respond_to :html

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		[	:first_name, :last_name, :username, :sex, :is_univ_student, :is_student_at_minho_univ,
			:is_inf_eng_student_at_minho_univ, :is_cesium_associate,
			:cesium_associate_number, :minho_univ_student_id, :university,
			:course, :location
		].each do |p|
			devise_parameter_sanitizer.for(:sign_up) << p
		end

		[	:birthday, :biography, :facebook_account, :twitter_account,
	 		:github_account, :google_plus_account, :avatar
		].each do |p|
			devise_parameter_sanitizer.for(:account_update) << p
		end
	end
end
