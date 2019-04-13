Rails.application.routes.draw do
  get '/' ,to: 'home#index'
  get '/orders/all' , to: 'orders#view_all'
#   delete  '/orders/all' 
#     to: 'orders#cancel', :locals => {:id => params[:id]}

 delete '/orders/:id' , to: 'orders#cancel', as: "order_path"

  get '/orders/:id' ,to: 'items#view_items'
  post '/orders/:id',to: 'items#create_item'
  get '/orders/all' , to: 'orders#view_all'

 # devise_for :users
#devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


#devise_scope :user do
#  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

