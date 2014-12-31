class Admin::MessagesController < Admin::AdminController

  def index
    @messages = Message.desc(:created_at)
  end

  def show
    @message = Message.find(params[:id])
  end
end
