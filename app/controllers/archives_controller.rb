class ArchivesController < ApplicationController
  def index
    @articles_month = Article.all.group_by{ |a| a.created_at.beginning_of_year }
  end
  # def index
  #   @articles_year = Article.all.group_by{ |a| a.created_at.beginning_of_year }
  #   @articles_array = []
  #   if params[:month_id]
  #     @articles_year.each do |year, a|
  #       if year.beginning_of_year.year.to_s == params[:year_id]
  #         @articles_result = a
  #       end
  #     end
  #   end
  # end
end
