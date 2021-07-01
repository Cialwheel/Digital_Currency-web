class Admin::CoinsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]
  before_action :require_is_admin
  def import
    Coin.import(params[:file])
    redirect_to coins_url
  end

  def index
    @coins = Coin.all
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
