class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  layout 'admin'

  def index
    @articles = Article.order("id DESC").all
  end


  def show
  end


  def new
    @article = Article.new
  end


  def edit
  end


  def create
    @user = User.find_by(params[:id])
    @article = @user.articles.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_articles_path, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @article = Article.find(params[:id])
    unless @article.find_like(current_user)  # 如果已经按讚过了，就略过不再新增
      Like.create( :user => current_user, :article => @article)
    end

  end

  def unlike
    @article = Article.find(params[:id])
    like = @article.find_like(current_user)
    like.destroy

    render "like"
  end


  private


    def set_article
      @article = Article.find(params[:id])
    end


    def article_params
      params.require(:article).permit(:title,:text,:logo,:remove_logo,:remove_images,:images=>[])
    end
end
