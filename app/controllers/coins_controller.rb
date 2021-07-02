class CoinsController < ApplicationController
  def import
    Coin.import(params[:file])
    redirect_to admin_coins_url
  end

  def index
    @coins = Coin.all
  end

  def destroy
    @coins = Coin.all
    @coins.destroy_all
    flash[:warning] = "cleaned"
    redirect_to admin_coins_path
  end
end
