class MemberController < ApplicationController
  def index
  end

  def become_member
    @user = User.find_by(params[:id])
    @user.is_member = true
    @user.save
    if @user.is_member == true
      redirect_to member_index_path, notice: "您已加入会员"
    else
      redirect_to member_index_path, notice: "恭喜加入会员"
    end
  end
end
