class CommentsController < ApplicationController
  before_action :set_movie
  before_action :get_user_id

  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
    @user = Comment.joins(:comments).select('user.id')
    @username = Movie.joins(:user).select('user.username').where(:movie_id => @movie, :user_id => @user)
  end

  def new
    @comment = @movie.comments.new
    render partial: 'comments/form'
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to movie_comments_path(@movie)
    else
      render :new
    end
  end

  def edit
    render partial: 'comments/form'
  end

  def update
    if @comment.update(comment_params)
      redirect_to movie_comments_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_comments_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id).merge(user_id: current_user.id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def get_user_id
    @user = Comment.joins(:comments).select('user.id')
  end

end
