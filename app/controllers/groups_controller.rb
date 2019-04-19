class GroupsController < ApplicationController
  def index
    puts "inside groups"


    # @group = Group.where(id: params[:id])
    
    @groups = Group.where(user_id: current_user.id)
    @group_name = "group_name"
    puts "groupps" 
    puts @groups 
    @group_id = 0
    

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

  @groupsMember = GroupsMember.new()
  @groupsMember.user_id = 2
  @groupsMember.group_id = 22
  @groupsMember.save
  
  redirect_to action: "index"
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
      group_member_realname = group_member_name.name
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

end
