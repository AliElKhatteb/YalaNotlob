class GroupsMembersController < ApplicationController
  def index 
    @groups = Group.where(user_id: current_user.id)
    # render :action => 'show', :controller => 'groups'
   # render :controller => "groups", :action => "show"
   redirect_to :controller => 'groups' , :action => 'show'
  end
    
    def create
      @groupsMember = GroupsMember.new()
  @groupsMember.user_id = User.where(name: params[:group_member])
  @groupsMember.group_id = 16
  @groupsMember.save
  @groupsMember.save
 
end
end
