class MessagesController < ApplicationController
  protect_from_forgery with: :null_session,:only => [:create]

  def create
    Message.create(username:params[:username],email:params[:email],phone:params[:phone],content:params[:content])
    render :json =>{success:true} 
  end
end
