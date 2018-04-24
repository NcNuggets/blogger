class ArticlesController < ApplicationController
# Add the Articles Helper class so that we can use 'article_params'
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

# Creating Articles (new sends form data to create)
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

# Updating Articles (edit sends form data to update)
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

# Deleting Articles
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

end
