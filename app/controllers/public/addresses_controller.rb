class Public::AddressesController < ApplicationController
  before_action :authenticate_member!, only: [:index, :create, :edit, :update, :destroy]

  def index
    @address = Addresse.new
    @addresses = Addresse.all
  end

  def create
    @address = Addresse.new(address_params)
    @address.member_id = current_member.id
    if @address.save
      redirect_to addresses_path
    else
      @address = Addresse.new(address_params)
      @addresses = Addresse.all
      render :index
    end
  end

  def edit
    @address = Addresse.find(params[:id])
  end

  def update
    @address = Addresse.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      @address = Addresse.find(params[:id])
      render :edit
    end
  end

  def destroy
    @address = Addresse.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

    def address_params
      params.require(:addresse).permit(:post_code, :address, :name, :member_id)
    end

end
