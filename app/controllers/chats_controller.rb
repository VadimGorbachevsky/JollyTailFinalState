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
