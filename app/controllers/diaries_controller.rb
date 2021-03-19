class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @diaries  = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = Diary.new(diary_parameter)
    if @diary.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    if @diary.destroy
       redirect_to "/users/#{current_user.id}", notice:"削除しました"
    else
      render :show
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_parameter)
      redirect_to "/users/#{current_user.id}", notice: "編集しました"
    else
      render 'edit'
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  private

  def diary_parameter
    params.require(:diary).permit(:title, :content, :start_time, :image).merge(user_id: current_user.id)
  end

end