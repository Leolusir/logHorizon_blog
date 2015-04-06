module Admin
  class PostsControler < BaseController
    load_resource

    def new
      render 'articles/new' 
    end

    def create
    end

    def edit
      render 'articles/edit'
    end

    def update

    end
  end
end
