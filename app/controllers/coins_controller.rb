class CoinsController < ApplicationController

  def import
    Coin.import(params[:file])
    redirect_to coins_url
  end

  def index
    @q = Coin.ransack(params[:q])
    @coins = @q.result
  end

  def show
    @coin = Coin.find(params[:id])
  end

  def destroy
    @coins = Coin.all
    @coins.destroy_all
    flash[:warning] = "cleaned"
    redirect_to admin_coins_path
  end
end
