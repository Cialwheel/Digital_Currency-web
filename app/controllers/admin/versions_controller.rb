class Admin::VersionsController < ApplicationController
  layout 'admin'
  def index
    @versions = PaperTrail::Version.order("id DESC").page(params[:page])
  end

  def undo
    @version = PaperTrail::Version.find(params[:version_id])
    @version.reify.save!
    redirect_to admin_versions_path
  end

  def clean
    @versions = PaperTrail::Version.all
    @versions.destroy_all
    flash[:warning] = "cleaned"
    redirect_to admin_versions_path
  end
end
