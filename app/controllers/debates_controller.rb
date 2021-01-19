class DebatesController < ApplicationController

  def index
    @debates = Debate.all
  end

  def new
    @debate = Debate.new
    @boards = Board.all
  end

  def create
    @debate = Debate.new(debate_params)
    if @debate.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @debate = Debate.find(params[:id])
    if @debate.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def debate_params
    params.require(:debate).permit(:name, :start_time, coach_ids: [], user_id: [])
  end
end
