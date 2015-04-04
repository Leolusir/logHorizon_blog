class WelcomeController < ApplicationController
  def index
    if params[:page]
      @articles = Article.limit(5).offset(params[:page].to_i()*5)
    else
      @articles = Article.limit(5)
      params[:page] = 0
    end
  end
  def about
  end
end
