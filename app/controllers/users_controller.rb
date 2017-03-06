class UsersController < ApplicationController
  before_action :authorizedUser, only: [:index]
  before_action :notAuthorizedUser, only: []
  def index

  end

  def login
    @login = params[:login][:login]
    @password = params[:login][:password]
    require 'uri'
    require 'net/http'
    url = URI("https://intra.epitech.eu")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["cache-control"] = 'no-cache'
    request["content-type"] = 'application/x-www-form-urlencoded'
    request.body = "login=#{@login}&password=#{@password}&format=json"
    response = http.request(request)
    puts response.read_body
    if response.read_body == "Moved to <a href=\"/\">\"/\"</a>"
      @user = User.where('email' => params[:login][:login])
      if @user
        session[:current_user_id] = @user.ids
        redirect_to "/home"
      end
    else
      flash[:notice_fail_log] = "Login / Mot de passe incorrect"
      redirect_to "/"
    end
  end

  def logout
    flash[:notice_logout] = "Déconnexion réussie "+ @user[0][:email] +" a bientot"
    session[:current_user_id] = nil
    redirect_to "/"
  end

  def home
  @event = Event.where(:promotions =>  @user[0][:promotion])

  end

  def manage

  end

  def joinEvent
  @event = Event.where(:promotions =>  @user[0][:promotion])
  end

  def eventJoin
    @event = UserEvent.new(:idUser => @user[0][:promotion], :idEvent => 1)
    @event.save
  end
end


