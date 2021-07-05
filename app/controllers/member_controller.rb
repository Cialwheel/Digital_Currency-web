class MemberController < ApplicationController
  def index
  end

  def become_member
    @user = User.find_by(params[:id])
    if @user.is_member == true
      redirect_to member_index_path, notice: "您已加入会员"
    else
      redirect_to member_index_path, notice: "加入会员成功"
    end
    @user.is_member = true
    @user.save
  end

  def cancel_member
    @user = User.find_by(params[:id])
    if @user.is_member == false
      redirect_to member_index_path, alert:  "您已取消会员，如需加入会员请查看主页面了解详情"
    else
      redirect_to member_index_path, alert: "取消会员成功"
    end
    @user.is_member = false
    @user.save
  end
end
