class AdminController < ApplicationController
  def index
    redirect_to admin_articles_path
  end
end
