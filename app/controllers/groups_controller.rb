class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @groupsMembers = GroupsMember.where(group_id: 15)
    @ww=@groupsMembers[0].group.group_name
    puts @ww
    puts "gggggggggggggggg"
  end
  def create
  @group = Group.new()
  @group.group_name= params[:group_name]
  @group.user=current_user
  
  @group.save
  redirect_to action: "index"
end

end
