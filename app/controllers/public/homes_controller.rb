class Public::HomesController < ApplicationController

  def top
    @lastest_items = Item.where(is_active: true).first(4)
    @genres = Genre.all
  end

  def about
  end
end
