class Admin::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @items = Item.where("name LIKE ?", "%#{@word}%").page(params[:page]).per(10)
    @genres = Genre.all
  end

end
