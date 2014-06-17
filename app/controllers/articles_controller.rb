class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to '/articles'
    else
      falsh.now[:notice] = "Could not be saved"
      render :new
    end
  end

    def show
      @article = Article.find(params[:id])
      @comment = Comment.new
    end

    private

    def article_params
      params.require(:article).permit(:title,
        :author,
        :body,
        category_ids: [])
    end
end
