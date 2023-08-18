class Public::MembersController < ApplicationController
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to members_mypage_path
    else
      @member = current_member
      render :edit
    end
  end

  def quit
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

    def member_params
      params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :post_code, :address, :telehpone_number)
    end

end
