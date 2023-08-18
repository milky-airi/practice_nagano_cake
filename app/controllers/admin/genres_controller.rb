class Admin::GenresController < ApplicationController

  def edit
    @genre = Genre.find(params[:id])
  end
end
