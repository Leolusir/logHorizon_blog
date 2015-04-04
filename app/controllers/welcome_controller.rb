class WelcomeController < ApplicationController
  def index
    page_count = Article.all.count / 5
    if params[:page].to_i <= page_count
      @articles = Article.limit(5).offset(params[:page].to_i()*5)
    else
      @articles = Article.limit(5)
      params[:page] = 0
    end
  end
  def about
  end
end
