class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		respond_to do |format|
			@path = welcome_index_path
			format.js { render %(window.location.pathname='#{@path}') }
		end
		return
	end
end