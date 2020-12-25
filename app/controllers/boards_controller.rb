class BoardsController < ApplicationController
  before_action :correct_post,only: [:edit]

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
    Board.create(board_parameter)
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

  def correct_post
    @board = Board.find(params[:id])
    unless @board.coach_id == current_coach.id
      redirect_to boards_path
    end
  end

end
