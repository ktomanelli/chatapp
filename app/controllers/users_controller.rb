class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:new, :create]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end
    
    def edit
    end
    
    def update
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
    def show
    
    end
    
    def destroy
        @user.destroy
        redirect_to new_user_path
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :img_url, :bio, :password, :password_confirmation)
    end
end
