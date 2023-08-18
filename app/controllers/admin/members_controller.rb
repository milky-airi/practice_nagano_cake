class Admin::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

end
