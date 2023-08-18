class Public::HomesController < ApplicationController
  def top
    @lastest_items = Item.first(4)
    @genres = Genre.all
  end

  def about
  end
end
