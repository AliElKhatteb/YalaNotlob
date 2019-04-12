Rails.application.routes.draw do
  get '/' ,to: 'home#index'
  get '/orders/:id' ,to: 'items#view_items'
  post '/orders/:id',to: 'items#create_item'

 # devise_for :users
#devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


#devise_scope :user do
#  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

