class CoinsController < ApplicationController

  def index
    @q = Coin.ransack(params[:q])
    @coins = @q.result
  end

  def destroy
    @coins = Coin.all
    @coins.destroy_all
    flash[:warning] = "cleaned"
    redirect_to admin_coins_path
  end
end
