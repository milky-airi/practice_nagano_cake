class Public::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @items = Item.where("name LIKE ?", "%#{@word}%").page(params[:page]).per(9)
    @genres = Genre.all
  end

  def genre_search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id).page(params[:page]).per(9)
    @genres = Genre.all
  end

end
