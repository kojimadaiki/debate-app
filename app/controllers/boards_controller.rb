class BoardsController < ApplicationController
  before_action :correct_post, only: [:edit]
  before_action :authenticate_user!, unless: proc { coach_signed_in? }

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    if current_coach.present?
      Board.create(board_parameter)
    else
      current_user.present?
      Board.create(boards_parameter)
    end
    redirect_to boards_path
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_parameter)
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
