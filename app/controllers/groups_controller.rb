class GroupsController < ApplicationController
  def index
    puts "inside groups"


    # @group = Group.where(id: params[:id])
    
    @groups = Group.where(user_id: current_user.id)
    @group_name = "group_name"
    puts "groupps" 
    puts @groups 
    @group_id = 0
  end
  def create
    unless params[:group_name].empty?
  allgroups = Group.all
  flag = false
  for group in allgroups
  puts "llllllllllllllllllll"
  puts group.group_name
  if group.group_name == params[:group_name]
   flag = true
  end
end
if flag == false

  @group = Group.new()
  @group.group_name= params[:group_name]
  @group.user=current_user
  @group.save

  @groupsMember = GroupsMember.new()
  @groupsMember.user_id = 2
  @groupsMember.group_id = 22
  @groupsMember.save
  
    redirect_to action: "index"
else
  redirect_to action: "index"
end
    
  else
     redirect_to action: "index"

  end
  end

  def show
     @groups = Group.where(user_id: current_user.id)

     @clickedGroup = Group.find(params[:id])

     @groupsMembers = GroupsMember.where(group_id: params[:id])
     
     for groupMember in @groupsMembers do 
      puts "kkkkkkkkkkkk"
      puts groupMember.id
      puts "jjjjjjjj"
     end
     @group_name = @clickedGroup.group_name
     @group_id = @clickedGroup.id
     group_member_names = []
     if @groupsMembers.any?{ |e| e.nil? }
      @group_member_names = ["add", "user"]
     else
     for groupMember in @groupsMembers do 
      group_member_name = User.find(groupMember.user_id)
      group_member_realname = group_member_name
      @group_member_names = group_member_names.push(group_member_realname)
     end
    end
    #  for group_meber_name in @group_member_names do 
    #  puts group_meber_name
    #   puts "shhhhhhhow22222222"
    #  end

    #  @group_member_names = User.where(id)
    #  puts @groupsMembers[0].id
     puts "shhhhhhhow"
     render "index"

  end
  def destroy
    Group.find(params[:id]).destroy
    redirect_to groups_path

  end
  def addMember
  @usergr1=User.where(email: params[:group_member])
  unless @usergr1.empty?

   @usergr= current_user.friendships.where(friend_id: @usergr1.first.id)
   unless @usergr.empty?
    # if @current_group == 0//////////////
  @current_group = Group.find(params[:id])
    if @current_group.groups_members.exists? user: @usergr.first.friend.id 
     
      redirect_to group_path( params[:id])
  else

  @gmember=GroupsMember.new
  @gmember.group_id= params[:id]
  @gmember.user_id = @usergr.first.friend.id
  @gmember.save
  redirect_to group_path( params[:id])
  end
else
  redirect_to group_path( params[:id])


end
else
  redirect_to group_path( params[:id])


end
  end
def deleteMember
  puts "inside delete"
  puts params[:id]
  puts params[:uid]
  GroupsMember.where(:user_id => params[:uid], :group_id => params[:id]).first.destroy


  redirect_to group_path( params[:id])
end






end
