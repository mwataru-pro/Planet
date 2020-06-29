class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    @article.admin_id = current_admin.id
    @article.save
    redirect_to admin_articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admin_article_path(@article)
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:article_title, :article_content, :article_image)
  end
end
