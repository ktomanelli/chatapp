class ApplicationController < ActionController::Base

    before_action :current_user
    before_action :authenticate_user

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end 

helper_method :current_user 

    def authenticate_user
        if @current_user
        else 
            flash[:error] = "Please Log In or Create an Acccount"
            redirect_to '/login'
        end 
    end 
end
