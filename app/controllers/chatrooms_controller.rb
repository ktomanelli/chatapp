class ChatroomsController < ApplicationController
    before_action :find_chatroom, only: [:show, :edit, :update, :destroy]
    
    def new
        @chatroom = Chatroom.new
    end
    
    def create
        @chatroom = Chatroom.create(chatroom_params)
        if @chatroom.valid?
            redirect_to chatroom_path(@chatroom.id)
        else 
           flash[:errors] = @chatroom.errors.full_messages
           redirect_to new_chatroom_path 
        end
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

end
