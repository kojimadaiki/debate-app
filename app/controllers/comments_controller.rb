class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @debate = Debate.find(params[:debate_id])
    # @comments = @debate.comments.includes(:coach)
    # @comments = @debate.comments.includes(:user)
  end
  
  def create
    @debate = Debate.find(params[:debate_id])
    @comment = @debate.messages.new(comment_params)
    if @comment.save
      redirect_to debate_comments_path(@debate)
    else
      render :index
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, coach_id: current_coach.id)
  end
end