class CoinallsController < ApplicationController

  def index
    @search = Coin.ransack(params[:q])
    @search.sorts = 'id DESC' if params[:order]=='by_lowerid_bound'
    @search.sorts = 'id ASC' if params[:order]=='by_upperid_bound'
    @search.sorts = 'mc DESC' if params[:order]=='by_lowermc_bound'
    @search.sorts = 'mc ASC' if params[:order]=='by_uppermc_bound'
    @search.sorts = 'mv DESC' if params[:order]=='by_lowermv_bound'
    @search.sorts = 'mv ASC' if params[:order]=='by_uppermv_bound'
    @search.sorts = 'price DESC' if params[:order]=='by_lowerprice_bound'
    @search.sorts = 'price ASC' if params[:order]=='by_upperprice_bound'
    @search.sorts = 'marketl DESC' if params[:order]=='by_lowerml_bound'
    @search.sorts = 'marketl ASC' if params[:order]=='by_upperml_bound'
    @search.sorts = 'quota DESC' if params[:order]=='by_lowerquota_bound'
    @search.sorts = 'quota ASC' if params[:order]=='by_upperquota_bound'
    @search.sorts = 'week DESC' if params[:order]=='by_lowerweek_bound'
    @search.sorts = 'week ASC' if params[:order]=='by_upperweek_bound'
    @coins = @search.result
  end
end
