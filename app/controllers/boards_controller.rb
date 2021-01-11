class BoardsController < ApplicationController
  before_action :correct_post, only: [:edit]
  before_action :authenticate_user!, unless: proc { coach_signed_in? }

  def index
    @boards = Board.all
    @board = Board.new
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
    @boards = Board.all
  end

  def create
    if current_coach.present?
      Board.create(board_parameter)
    else
      current_user.present?
      Board.create(boards_parameter)
    end
    flash[:aiueo] = '討論時間を登録しました。'
    redirect_to boards_path
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    flash[:aiueo] = '討論時間を削除しました。'
    redirect_to boards_path
  end

  def edit
    @board = Board.find(params[:id])
    @boards = Board.all
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_parameter)
      flash[:aiueo] = '討論時間を更新しました。'
      redirect_to boards_path
    else
      render 'edit'
    end
  end

  private

  def board_parameter
    params.require(:board).permit(:name, :title, :start_time).merge(coach_id: current_coach.id, name: current_coach.name)
  end

  def boards_parameter
    params.require(:board).permit(:name, :title, :start_time).merge(user_id: current_user.id, name: current_user.name)
  end

  def correct_post
    @board = Board.find(params[:id])
    redirect_to boards_path unless @board.coach_id == current_coach.id
  end
end
