class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @debate = Debate.find(params[:debate_id])
    @comments = @debate.comments.includes(:coach)
    @comments = @debate.comments.includes(:user)
  end

  def create
    @debate = Debate.find(params[:debate_id])
    if coach_signed_in?
      @comment = @debate.comments.new(coach_comment_params)
    else user_signed_id?
      @comment = @debate.comments.new(user_comment_params)
    end
    if (@comment || @comments).save 
      redirect_to debate_comments_path(@debate)
    else
      @comments = @debate.comments.includes(:coach)
      @comments = @debate.comments.includes(:user)
      render :index
    end
  end

  private

  def coach_comment_params
    params.require(:comment).permit(:content).merge(coach_id: current_coach.id)
    if current_coach.id.present?
    end
  end

  def user_comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
    if current_user.id.present?
    end
  end
end
