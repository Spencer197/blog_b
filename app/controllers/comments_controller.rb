class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "foo", password: "bar", only: :destroy
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)#Once we have made the new comment, we send the user back to the original article using the article_path(@article) helper.
  end
 
  #The destroy action will find the article we are looking at, locate the comment within the @article.comments collection, and then remove it 
  #from the database and send us back to the show action for the article:
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
