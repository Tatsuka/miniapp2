class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Article.create(articles_params)
  end

  private
  def articles_params
    params.permit(:name, :text)
  end
end
