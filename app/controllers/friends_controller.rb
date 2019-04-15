class FriendsController < ApplicationController
    def friendhome
        @user=User.all
        @friends=UserFriend.where(user_id:current_user.id)
        
    end
   
    def adduser
        puts "here"
        puts params[:adduser]
        begin 
            @u=User.find_by(email:params[:adduser]).id
        rescue
            redirect_to('/friends')
        ensure
           @doesntexsist="user not found"
        end




        @addfrienduser=UserFriend.new
        if @u!=nil
            @addfrienduser.user_id=current_user.id
            if @u!=current_user.id
                
                   @addfrienduser.friend_id=@u
                   @addfrienduser.save
                   redirect_to('/friends')
                
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
        redirect_to('/friends')
    
        
    end    
    

end
