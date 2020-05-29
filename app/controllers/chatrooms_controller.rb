class ChatroomsController < ApplicationController
    before_action :find_chatroom, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    def new
        @chatroom = Chatroom.new
    end
    
    def create
        # puts params
        # @to_id = User.find_by(name:params[chatroom_data][to]).id
        # @chatroom = Chatroom.create(title:params[chatroom_data][title],user_id:@current_user.id)
        # UserChatroom.create(user_id:params[chatroom_data][from_id],chatroom_id:@chatroom.id)
        # UserChatroom.create(user_id:@to_id,chatroom_id:@chatroom.id)
        # if @chatroom.valid?
        #     redirect_to chatroom_path(@chatroom.id)
        # else 
        #    flash[:errors] = @chatroom.errors.full_messages
        #    redirect_to new_chatroom_path 
        # end
    end
    
    def edit
    end
    
    def update
        @chatroom.update(chatroom_params)
        redirect_to chatrooms_path
    end
    
    def show
    end
    
    def destroy
        @chatroom.destroy
        redirect_to chatrooms_path
    end

    private
    def find_chatroom
        @chatroom = Chatroom.find(params[:id])
    end

    def chatroom_params
        params.require(:chatroom).permit(:title)
    end

    def display_messages
        if params[:id]
            @chatroom = Chatroom.find(params[:id])
            @messages = @chatroom.messages.sort do |a,b|
                a.created_at<=>b.created_at
            end
        end
    end
end
