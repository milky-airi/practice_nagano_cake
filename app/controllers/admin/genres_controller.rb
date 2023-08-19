class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :index, :edit, :update]

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genre = Genre.new(genre_params)
      @genres = Genre.all
      render :index
    end
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      @genre = Genre.find(params[:id])
      render :edit
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end


end
