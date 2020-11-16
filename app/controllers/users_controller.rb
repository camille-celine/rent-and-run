class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private
  def listing_params
    params.require(:users).permit(:name, :email, :encrypted_password, :img_url)
  end
end
