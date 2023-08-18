class Public::AddressesController < ApplicationController
  def index
    @addresse = Addresse.new
  end

  def edit
    @addresse = Addresse.find(params[:id])
  end
end
