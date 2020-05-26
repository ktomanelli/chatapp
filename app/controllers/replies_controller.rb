class RepliesController < ApplicationController
    before_action :find_reply, only: [:edit, :update, :destroy]
    
    def new
        @reply = Reply.new
    end

    def create
        @reply = Reply.create(reply_params)
        if @reply.valid?
            redirect_to message_path(@reply.message_id)
        else
            flash[:errors] = @reply.errors.full_messages
            redirect_to new_reply_path
        end
    end

    def edit
    end

    def update
        @reply.update(reply_params)
        redirect_to message_path(@reply.message_id)
    end

    def destroy
        @reply.destroy
        redirect_to message_path(@reply.message_id)
    end

    private
    def reply_params
        params.require(:reply).permit(:message_id, :from_id, :content)
    end

    def find_user
        @reply = Reply.find(params[:id])
    end
    
end
