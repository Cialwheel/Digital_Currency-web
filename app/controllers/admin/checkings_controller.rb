class Admin::CheckingsController < ApplicationController
  layout 'admin'
  def index
    @checkings = Checking.all
  end


end
