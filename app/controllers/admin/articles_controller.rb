class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user! # 「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    @article.admin_id = current_admin.id
    if @article.save
    redirect_to admin_articles_path, notice: "記事が作成されました"
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
    redirect_to admin_article_path(@article), notice: "記事が更新されました"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
    redirect_to admin_articles_path, notice: "記事が削除されました"
    else
      render 'edit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:article_title, :article_content, :article_image)
  end
end
