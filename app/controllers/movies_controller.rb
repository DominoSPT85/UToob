class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show

  end

  def new
    @movie = Movie.new(movie_params)
    render partial: 'movies/form'
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    render partial: 'movies/form'
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to  movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_description_iframe
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://www.youtube.com"
    render
  end

end
