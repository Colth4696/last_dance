class MessagesController < ApplicationController
    def create
        message = Message.new(message_params)
        chatroom = Chatroom.find(message_params["chatroom_id"])
        if message.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to chatroom, serialized_data
            head :ok
        # end
        else
            render json: message.errors.full_messages
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body, :chatroom_id, :user_id)
    end
  end
