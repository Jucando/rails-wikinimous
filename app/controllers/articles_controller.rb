class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :show, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_param)
    redirect_to article_path(@article.id)
  end

  def edit
  end

  def show
  end

  def update
    @article.update(article_param)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article.delete
    redirect_to root_path
  end

  private

  def article_param
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
