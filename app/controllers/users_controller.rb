class UsersController < ApplicationController
  def follow   #follow or unfollow
    @user = User.find(params[:id])
    @voter= User.find(1)
    if    @voter.voted_for? @user
          @user.unliked_by @voter
          @size=@user.get_likes.size
          p @size
          p '------'
          redirect_to user_path(@user.id)
    else
          @user.liked_by @voter
          @size=@user.get_likes.size
          p @size
          p 'dad'
          redirect_to user_path(@user.id)
    end
  end


  def show
    @user = User.find(params[:id])

      @size=@user.get_likes.size
  
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    end
  end
  def user_params
    params.require(:user).permit(:name)
  end
end
