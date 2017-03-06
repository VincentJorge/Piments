Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Affiche la vue de la page login admin
  get '/admin', to: 'administrations#index'

  # Post du formulaire de connexion
  post '/login', to: 'administrations#login'
  # Redirection si la connexion est true
  get 'admin/home', to: 'administrations#home'

  # Déconnexion
  get 'admin/logout', to: 'administrations#logout'

  # Accés a la page d'évenement
  get 'admin/event', to: 'administrations#event'

  # list tout les events
  get 'admin/event/all', to: 'administrations#listEvent'


  # Création d'évenement
  get 'admin/event/new', to: 'administrations#newEvent'
  post 'admin/event/new', to: 'administrations#createEvent'

  # Suppr l'évenement
  get 'admin/event/eventDel', to: 'administrations#eventDel'

  # Edite l'évenement
  get 'admin/event/update/', to: 'administrations#update'

  # View promotion
  get '/admin/promotion', to: 'administrations#promotion'

  # Création promotion
  get 'admin/promotion/new', to: 'administrations#newPromotion'
  post 'admin/promotion/new', to: 'administrations#createPromotion'

  # List toute les promotions
  get 'admin/promotion/all', to: 'administrations#listPromotion'

  # Admin panel
  get 'admin/default', to: 'administrations#default'
  post 'admin/default', to: 'administrations#newAdmin'

  # Admin User
  get 'admin/user', to: 'administrations#userList'
  get '/admin/user/:id', to: 'administrations#updateUser'
  post '/admin/user/:id', to: 'administrations#userUpdate'
  # Login user
  get '/', to: 'users#index'
  post '/', to: 'users#login'

  # Home user
  get '/home', to: 'users#home'

  # Logout User
  get '/logout', to: 'users#logout'

  # User manage
  get '/user/account', to: 'users#manage'

  # Post JoinEvent
  get '/user/event', to: 'users#joinEvent'
  get '/user/newEvent', to: 'users#eventJoin'
end
