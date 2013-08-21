class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) # postu bul.Cunku commentin icinden post_id gelecek
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))           #bulunca create et
    redirect_to post_path(@post)  #commenti kaydet showa geri git
  end
  def destroy                               #method delete olunca buraya gelir
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy                 #commenti destroy etti
    redirect_to post_path(@post)
  end

end
