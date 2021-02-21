class MessesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
      if(cookies[:chat] && Chat.exists?(cookies[:chat].to_i))
        @mess = Mess.create(user: true, body: params[:mess][:body])
        @mess.chat = Chat.find(cookies[:chat])
        @mess.save
    else
        @new_chat  = Chat.create()
        cookies[:chat] = @new_chat.id
        #cookies['chat'] = {
       #:value => @new_chat.id,
       #:expires => 1.year.from_now,
       #:domain => 'jollytail.ru'
        #}
        @mess = Mess.create(user: true, body: params[:mess][:body])
        @mess.chat = @new_chat
        @mess.save
        
    end
      
redirect_to root_url
  end

  def update
  end

  def destroy
  end
  
  def mess_params
    params.require(:mess).permit(:id, :chat_id, :user, :body)
  end
  
  def chat_params
    params.require(:chat).permit(:id, :cook, :permanent, :user_id)
  end

end
