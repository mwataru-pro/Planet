class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).search(params[:search])
  end

  def show
    @article = Article.find(params[:id])
  end
end
