class Admin::CoinsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]
  before_action :require_is_admin
  layout 'admin'
  def import
    Coin.import(params[:file])
    redirect_to coins_url
  end

  def index
    @coins = case params[:order]
            when 'by_lower_bound'
              Coin.order('id DESC')
            when 'by_upper_bound'
              Coin.order('id ASC')
            else
              Coin.order('id')
            end
  end

  def show
    @coin = Coin.find(params[:id])
  end

  def destroy
    @coins = Coin.all
    @coins.destroy_all
    flash[:warning] = "cleaned"
    redirect_to coins_path
  end

  def edit
    @coin = Coin.find(params[:id])
  end

  def update
    @coin = Coin.find(params[:id])
    if @coin.update(coin_params)
      redirect_to admin_coins_path
    else
      render :edit
    end
  end

  def destroy
    @coin = Coin.find(params[:id])
    @coin.destroy
    redirect_to admin_coins_path
  end

  def bulk_update
    total = 0
    Array(params[:ids]).each do |coin_id|
      coin = Coin.find(coin_id)
      coin.destroy
      total+=1
    end
    flash[:warning] = "成功完成#{total}笔"
    redirect_to admin_coins_path
  end

  private

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  def coin_params
    params.require(:coin).permit(:name,:mc,:mv,:price,:marketl,:quota,:week)
  end
end
