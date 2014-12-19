class SessionsController < ApplicationController

  protect_from_forgery with: :null_session,:only => [:create]

  layout false
  
  def new
    redirect_to admin_journalisms_url if current_user.present?
  end

  def login
    user = User.login(params)
    if user.present?
      refresh_session(user.id.to_s)
    end
    render :json => {success:user}
  end

  def destroy
  end
end
