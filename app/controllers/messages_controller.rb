class MessagesController < ApplicationController

    
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.create(message_params)
        if @message.valid?
            redirect_to message_path(@message)
        else
            flash[:errors] = @message.errors.full_messages
            redirect_to new_message_path
        end
    end
    
    def edit
    end
    
    def update
        @message.update(message_params)
        redirect_to message_path(@message.id)
    end
    
    
    def destroy
        @message.destroy
        redirect_to new_message_path
    end

    private 
    def find_message 
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:content, :from_id, :to_id, :chatroom_id)
    end
end
