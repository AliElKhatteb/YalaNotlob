Rails.application.routes.draw do
  get 'events/index'
  get '/' ,to: 'home#index'
  #get '/groups' ,to: 'groups#index'
  #resources :groups
  resources :groups do
    
    resources :groups_members
    
  end
  post '/groups/:id/addFriend' , to: 'groups#addMember'
  delete 'group/:id/:uid' ,to: 'groups#deleteMember', as: "delete_member"
  delete 'items/:idO/:idu' ,to: 'items#deleteInvited' , as: "delete_invited"
#   get 'friends', to: 'friends#friendhome'
#   post 'friends', to: 'friends#adduser'
#   delete '/friends/:id', to: 'friends#destroy', as:"delete_user"
#   get '/' ,to: 'home#index'
#   get '/orders' , to: 'orders#view_all' ,as: "view_orders"
#   get '/orders/add' , to: 'orders#view_orders' ,as: "new_order"
#     post '/orders/add' , to: 'orders#create_orders' ,as: "create_order"

#   delete '/orders/:id' , to: 'orders#cancel', as: "order_path_delete"
#   post '/orders/:id' , to: 'orders#finish', as: "order_path_finish"
#   post '/orders/:id/items',to: 'items#create_item'
#   get '/orders/:id/items' ,to: 'items#view_items' , as: "order_items"

  
#   post '/orders/addfriend' ,to: 'ordres#addFriendGroup' ,as: "addFriendGroup"

resources :orders do
    resources :items 
    resources :order_users
    
  end
  resources :friends
  
  # order_addfriend_url

 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 notify_to :users, with_devise: :users
 get 'user/notifications_list'
 get 'user/notifications_list'
 get 'user/notifications_center'
 get 'orders/display_notification' 

#devise_scope :user do
#  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
