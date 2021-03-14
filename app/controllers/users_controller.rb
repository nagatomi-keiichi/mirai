class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries
  end

  def index
    @users = User.all
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
  end

  
end
end
