class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_reader :current_user
  before_action :init
  helper_method :current_user


  def init
    refresh_session(params[:user_id] || cookies[:user_id])
  end

  def refresh_session(user_id=nil)
    unless cookies[:user_id].present?
      @current_user = user_id.blank? ? nil : User.where(_id:user_id).first
    else
      @current_user = User.where(_id:cookies[:user_id]).first
    end

    if current_user.present?
      cookies[:user_id] = {
        :value => user_id,
        :expires => Rails.application.config.permanent_signed_in_days.days.from_now,
        :domain => :all
      }
      return true
    else
      cookies.delete(:user_id, :domain => :all)
      return false
    end
  end
end
