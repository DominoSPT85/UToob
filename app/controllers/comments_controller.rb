class CommentsController < ApplicationController

  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = current_user.comment.new(comment_params)
  end

  def create
    @comment = current_user.comment.new(comment_params)
    if @comment.save
      redirect_to movies_show_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment.params)
      redirect_to movies_show_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movies_show_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find(params[:id]) 
  end
end