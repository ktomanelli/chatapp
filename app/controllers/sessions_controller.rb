class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:home, :new, :create]
    
    def home
        
    end
    
    def new
    end
    
    def create
    user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
                redirect_to user_path(user.id), notice: 'Welcome Back'
        else
            flash[:errors] = "Invalid Username and/or Password"
            redirect_to login_path
        end
    end
    
    
    def destroy
        session[:user_id] = nil
        redirect_to home_path, notice: "Successfully Logged Out"
    end
end
