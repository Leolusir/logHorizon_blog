class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    count = @article.count
    @article.update_columns(count: count+1)
  end

end
