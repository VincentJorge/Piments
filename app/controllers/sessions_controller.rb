class SessionsController < ApplicationController
  def new

  end
  def create
    session[:current_admin_id] = @administration.id
    session[:current_user_id] = @user.id
  end
end
