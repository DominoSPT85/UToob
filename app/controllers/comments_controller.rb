class CommentsController < ApplicationController
  before_action :set_movie

  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
    @user = current_user
    @results = Movie.joins(:user).select('user.username').where(:movie_id => @movie, :user_id => @user)
  end

  def new
    @comment = current_user.@movie.comments.new
    render partial 'comments/form'
  end

  def create
    @comment = current_user.@movie.comments.new(comment_params)
    if @comment.save
      redirect_to movies_show_path(@movie)
    else
      render new
    end
  end

  def edit
    render partial 'comments/form'
  end

  def update
    if @comment.update(comment.params)
      redirect_to movies_show_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movies_show_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  # def set_user
  #   @user = User.current_user
  # end

end
