class DebatesController < ApplicationController
  # before_action :correct_post, only: [:new]

  def index
    @debates = Debate.all
  end

  def new
    @debate = Debate.new
  end

  def create
    @debate = Debate.new(debate_params)
    if @debate.save
      redirect_to debate_comments_path(@debate)
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
    params.require(:debate).permit(:name, coach_ids: [], user_id: [])
  end

  # def correct_post
  #   @debate = Debate.find(params[:id])
  #   redirect_to debates_path unless @debate.coach_id == current_coach.id
  # end
end
