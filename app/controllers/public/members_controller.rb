class Public::MembersController < ApplicationController
  def show
  end

  def edit
    @member = current_member
  end

end
