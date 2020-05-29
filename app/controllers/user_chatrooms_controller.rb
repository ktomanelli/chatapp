class UserChatroomsController < ApplicationController


    def new
        @user_chatroom = UserChatroom.new
    end
    def create
        @to = User.find_by(name:params[:user_chatroom][:user_id])
        if @to
            @cr = Chatroom.create(title:"#{@current_user.name}+#{@to.name}")
            UserChatroom.create(user_id:@to.id,chatroom_id:@cr.id)
            UserChatroom.create(user_id:@current_user.id,chatroom_id:@cr.id)
            redirect_to chatroom_path(@cr)
        else
            
            redirect_to new_user_chatroom_path
        end
    end


    private

    def user_chatroom_params
        params.require(:user_chatroom).permit(:user_id)
    end
end