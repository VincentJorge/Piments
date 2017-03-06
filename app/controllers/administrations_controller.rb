class AdministrationsController < ApplicationController

  before_action :authorized, only: [:index]
  before_action :notAuthorized, only: [:home, :logout, :listEvent, :createPromotion, :newPromotion,
                                       :event, :createEvent, :newEvent, :promotion, :default]

  def index

  end

  def login
    @administration = Administration.where('login' => params[:login][:login], 'password' => params[:login][:password])
    if @administration.empty?
      flash[:notice_fail_log] = "Login / Mot de passe incorrect"
      redirect_to "/admin"
    else
      session[:current_admin_id] = @administration.ids
      redirect_to "/admin/home"
    end
  end

  def logout
    flash[:notice_logout] = "Déconnexion réussie "+ @admin[0][:login] +" a bientot"
    session[:current_admin_id] = nil
    redirect_to "/admin"
  end
  def home
  #Vue de la page d'accueil admin
  end

  def event

  end

  def newEvent

  end

  def createEvent
    @event = Event.new(params.require(:newEvent).permit(:name, :descrip, :numberPiments, :promotions, :dateStart, :dateEnd))
    flash[:add_event] = "L'évenement est en ligne !"
    redirect_to "/admin/event/all"
    @event.save

  end

  def listEvent
    @events = Event.paginate(:page => params[:page], :per_page => 5)
  end

  def eventDel
    @event = Event.find(params[:id])
    flash[:del_event] = "L'évenement a était supprimé !"
    redirect_to "/admin/event/all"
    @event.destroy
  end

  def update
    @events = Event.find_by_id(params[:id])
  end

  def newAdmin
    @admin = Administration.new(params.require(:newAdmin).permit(:login, :password, :email, :role , :fname, :lname))
    flash[:add_admin] = "Le compte admin est crée !"
    redirect_to "/admin/default"
    @admin.save
  end

  def userList
    @user = User.paginate(:page => params[:page], :per_page => 10)

  end

  def promotion

  end

  def newPromotion

  end

  def createPromotion
  @promo = Promo.new(params.require(:newPromo).permit(:name, :school, :date, :administrateur))
  flash[:add_event] = "Promotion crée !"
  redirect_to "/admin/promotion/all"
  @promo.save
  User.import(params["newPromo"]['csv'], @promo.id)
  end

  def listPromotion
    @listPromotion = Promo.paginate(:page => params[:page], :per_page => 5)
  end

  def default

  end

  def updateUser
    @user = User.find_by_id(params[:id])
  end

  def userUpdate
   @id = params[:updateUser][:id]
    @userUpdate = User.where(:id => @id).update_all(params.require(:updateUser).permit(:id, :email, :role, :nbrPiments, :promotion))
  end
end
