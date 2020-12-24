class BoardsController < ApplicationController
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
    redirect_to board_path
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
    params.require(:board).permit(:title, :start_time)
  end
end