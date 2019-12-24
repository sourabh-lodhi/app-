class CommentsController < ApplicationController
  
# http_basic_authenticate_with name: "sourabh", password "thakur",
# only: :destroy

http_basic_authenticate_with name: "thakur", password: "sourabh", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
