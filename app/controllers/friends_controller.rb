class FriendsController < ApplicationController
    def index
        @user=User.all
        @friends=UserFriend.where(user_id:current_user.id)
        
        
        
    end
    @doesntexsist="ali"
    def create
        puts "here"
        puts params[:adduser]
        
        begin  # "try" block
            @u=User.find_by(email:params[:adduser]).id 
        rescue # optionally: `rescue Exception => ex`
            redirect_to friends_path

        ensure # will always get executed
            @doesntexsist="user doesnt exsist"
        end 
        @addfrienduser=UserFriend.new
        searchid=UserFriend.all
        friend_ids = []
        searchid.each do |s|
            friend_ids.push(s.friend_id)
        end
        states=friend_ids.include?@u

        if @u!=nil
            if !states
              @addfrienduser.user_id=current_user.id
            
              if @u!=current_user.id
                   @addfrienduser.friend_id=@u
                   @addfrienduser.save
                   redirect_to friends_path
                
              end
            end  
            
        end          
            
        #redirect_to action:friendhome
    end
    
    def destroy
        #session[:user_id] = nil
        
        @user = UserFriend.find_by(friend_id:params[:id])
        puts @user.id
        puts 
        @user.destroy
        redirect_to friends_path
    
        
    end    
    

end
