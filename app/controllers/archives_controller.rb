class ArchivesController < ApplicationController
  def index
    @articles_month = Article.all.group_by{ |a| a.created_at.beginning_of_year }
  end
end
