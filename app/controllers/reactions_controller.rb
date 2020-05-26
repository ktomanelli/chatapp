class ReactionsController < ApplicationController

    def new
        @reaction = Reaction.new
    end

    def create
        @reaction. Reaction.create(reaction_params)
        if @reaction.valid?
            redirect_to (@reaction.message_id)
        else
            flash[:errors] = @reaction.errors.full_messages
        end
    end

    def destroy
        @reaction = Reaction.find(params[:id])
        @reaction.destroy 
        redirect_to message_path(@reaction.message_id)
    end


    private
    def reaction_params
        params.require(:reaction).permit(:message_id, :from_id, :img_url)
    end

end
