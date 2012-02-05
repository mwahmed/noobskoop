require 'json'
class ChatsController < ApplicationController
def chat_display
if signed_in?
	render "chat_display"
else 	
	render "error"
end
end

def chat_update
#@chatmessages2=Chat.all.to_json;
@chatmessages=Chat.all;
@chattry=Array.new;
@chatmessages.each do |chatter|
@chattry.push chatter.userMessage;
puts @chattry;
end

respond_to do |format|
format.json do
render :json => {
:data => { :chatmessages => @chattry }
}

end
end
end

def chat_message

@newMessage=Chat.create(:userMessage => params["text"]);

end


end

