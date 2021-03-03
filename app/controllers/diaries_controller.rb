class DiariesController < ApplicationController
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
    Diary.create(diary_parameter)
    redirect_to diaries_path
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path, notice:"削除しました"
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_parameter)
      redirect_to diaries_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def diary_parameter
    params.require(:diary).permit(:title, :content, :start_time)
  end

end