class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)#Once we have made the new comment, we send the user back to the original article using the article_path(@article) helper.
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
