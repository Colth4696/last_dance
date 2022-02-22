class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_channel"
  end
  
def unsubcribed
end
end
