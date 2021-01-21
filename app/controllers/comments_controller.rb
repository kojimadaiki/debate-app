class CommentsController < ApplicationController
  before_action :authenticate_user!, unless: proc { coach_signed_in? }

  def index
    @commented = Comment.all
    @comment = Comment.new
    @debate = Debate.find(params[:debate_id])
    if coach_signed_in?
      @comments = @debate.comments.includes(:coach)
    else
      user_signed_in?
      @comments = @debate.comments.includes(:user)
    end
  end

  def create
    @commented = Comment.all
    @debate = Debate.find(params[:debate_id])
    if coach_signed_in?
      @comment = @debate.comments.new(coach_comment_params)
    else
      user_signed_in?
      @comment = @debate.comments.new(user_comment_params)
    end
    if @comment.save
      ActionCable.server.broadcast 'room_channel', comment: @comment.template
    else
      @comments = @debate.comments.includes(:coach)
      @comments = @debate.comments.includes(:user)
      render :index
    end
  end

  private

  def coach_comment_params
    params.require(:comment).permit(:content, :image, :video).merge(coach_id: current_coach.id)
  end

  def user_comment_params
    params.require(:comment).permit(:content, :image, :video).merge(user_id: current_user.id)
  end
end
