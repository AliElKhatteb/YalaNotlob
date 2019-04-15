Rails.application.routes.draw do
  get 'friends', to: 'friends#friendhome'
  post 'friends', to: 'friends#adduser'
  delete '/friends/:id', to: 'friends#destroy', as:"delete_user"
  get '/' ,to: 'home#index'
  get '/orders' , to: 'orders#view_all'
  get '/orders/add' , to: 'orders#view_orders'

  delete '/orders/:id' , to: 'orders#cancel', as: "order_path_delete"
  post '/orders/:id' , to: 'orders#finish', as: "order_path_finish"
  post '/orders/:id/items',to: 'items#create_item'
  get '/orders/:id/items' ,to: 'items#view_items' , as: "order_items"

  post '/orders/add' , to: 'orders#create_orders'
  
  post '/orders/addfriend' ,to: 'ordres#addFriendGroup' ,as: "addFriendGroup"
  # order_addfriend_url

  get 'event', to: 'events#index'
  mount ActionCable.server => '/cable'
 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


#devise_scope :user do
#  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end

