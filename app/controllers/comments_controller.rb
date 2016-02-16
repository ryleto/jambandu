class CommentsController < ApplicationController
  before_filter :load_commentable, :only => [:create]
  before_filter :authenticate_user!

  def index
    @comments = Comment.all
  end
  
  def create
    @comment = @commentable.comments.create(comment_params)
    if @comment.save
        redirect_to request.referer, :notice => "Comment submitted!"
    else
        render @companies
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment deleted"
    redirect_to request.referrer || comments_path
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :commentable_id, :commentable_type, :user_id, :role)
    end
        
    def load_commentable
      @commentable=params[:commentable_type].constantize.find(params[:commentable_id])
    end
end
