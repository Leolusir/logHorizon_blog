module Admin
  class ArticlesController < BaseController
    # load_resource

    def new
      @article = Article.new
      @tag = Tag.all
    end

    def index
      @articles = Article.all
    end
    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article, flash: {notice: "Article post successfully."}
      else
        render 'new', flash: {alert: "something was wrong"}
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      end
      render 'edit'
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      
      redirect_to admin_articles_path
    end
    private
    def article_params
      split_tags
      params.require(:article).permit(:title, :content, tag_ids: [])
    end
    def split_tags
      tag_ids = []
      tags = params[:tags].split(";")
      for tag in tags
        tagObject = Tag.find_by(name: tag)
        if tagObject
          tag_ids.push(tagObject.id)
        else
          newTag = Tag.create(name: tag)
          tag_ids.push(newTag.id)
        end
      end
      params[:article][:tag_ids] = tag_ids
    end
  end
end
