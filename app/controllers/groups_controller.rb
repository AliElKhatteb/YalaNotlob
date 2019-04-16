class GroupsController < ApplicationController
  def index

    # @group = Group.where(id: params[:id])
    
    @groups = Group.where(user_id: current_user.id)
    @group_name = "group_name"

    # @groupsMembers = GroupsMember.where(group_id: 15)
    # @ww=@groupsMembers[0].group.group_name
    # #@group_name = "Group Name"
    # puts @ww
    # puts "gggggggggggggggg"
  end
  def create
  @group = Group.new()
  @group.group_name= params[:group_name]
  @group.user=current_user
  
  @group.save
  redirect_to action: "index"
  end
  def show
    
     @groups = Group.where(user_id: current_user.id)

     @clickedGroup = Group.find(params[:id])

     @groupsMembers = GroupsMember.where(group_id: params[:id])
     @group_name = @clickedGroup.group_name
     puts @groupsMembers[0]
     puts "shhhhhhhow"
     render "index"

  end

end
