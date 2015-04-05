class ArchivesController < ApplicationController
  def index
    @articles_month = Article.all.group_by{ |a| a.created_at.beginning_of_year }
  end
  def show
    if params[:month_id] && params[:year_id]
      @articles_month = Article.all.group_by{|a| a.created_at.beginning_of_month}
      @articles_month.each do |month, array|
        if month.year.to_s == params[:year_id] && month.month.to_s == params[:month_id]
          @result = array
        end
      end
    elsif params[:year_id]
      @articles_year = Article.all.group_by{|a| a.created_at.beginning_of_year}
      @articles_year.each do |year, array|
        if year.year.to_s == params[:year_id]
          @result = array
        end
      end
    end
  end
end
