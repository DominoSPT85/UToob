class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movie = Movie.all
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
      redirect_to movies_index_path
    else
      render :new
    end
  end

  def edit
    render partial: 'movies/form'
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_index_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to  movies_index_path
  end

  private
  def movie_params
    params.require(:person).permit(:title, :duration, :genre, :description, :trailer)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
