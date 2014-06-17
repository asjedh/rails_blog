class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article

    if @comment.save
      redirect to "/articles/#{@article.id}"
    else
      flash.now[:notice] = "Uh oh! Not posted"
      render :new
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
