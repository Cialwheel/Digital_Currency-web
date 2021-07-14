class CoinsController < ApplicationController

  def import
    Coin.import(params[:file])
    redirect_to coins_url
  end

  def index
    @q = Coin.ransack(params[:q])
    @coins = @q.result
    @coins = case params[:order]
            when 'by_lowerid_bound'
              Coin.order('id DESC')
            when 'by_upperid_bound'
              Coin.order('id ASC')
            when 'by_lowermc_bound'
              Coin.order('mc DESC')
            when 'by_uppermc_bound'
              Coin.order('mc ASC')
            when 'by_lowermv_bound'
              Coin.order('mv DESC')
            when 'by_uppermv_bound'
              Coin.order('mv ASC')
            when 'by_lowerprice_bound'
              Coin.order('price DESC')
            when 'by_upperprice_bound'
              Coin.order('price ASC')
            when 'by_lowerml_bound'
              Coin.order('marketl DESC')
            when 'by_upperml_bound'
              Coin.order('marketl ASC')
            when 'by_lowerquota_bound'
              Coin.order('quota DESC')
            when 'by_upperquota_bound'
              Coin.order('quota ASC')
            when 'by_lowerweek_bound'
              Coin.order('week DESC')
            when 'by_upperweek_bound'
              Coin.order('week ASC')
            else
              Coin.all
            end
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
