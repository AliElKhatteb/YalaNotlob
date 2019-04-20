class UserController < ApplicationController
    before_action :authenticate_user!

  
    
    def notifications_list
      p "heloo"
      @notifications = current_user.notifications.unopened_only
      @users = User.all
      redirect_to "/users/#{current_user.id}/notifications"  
    end
  
    def notifications_center
      @notifications = current_user.notifications
      @users = User.all
      redirect_to "/users/#{current_user.id}/notifications"  
    end

  
  end