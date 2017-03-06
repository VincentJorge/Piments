class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :setSession, :setSessionUser

  private
  def setSession
    if session[:current_admin_id]
      @admin = Administration.find(session[:current_admin_id])
    end
  end

  def authorized
    if @admin
      redirect_to "http://localhost:3000/admin/home"
    end
  end

  def notAuthorized
    if !@admin
      redirect_to "http://localhost:3000/admin"
    end
  end

  def setSessionUser
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    end
  end

  def authorizedUser
    if @user
      redirect_to "http://localhost:3000/home"
    end
  end

  def notAuthorizedUser
    if !@user
      redirect_to "http://localhost:3000/"
    end
  end


end
