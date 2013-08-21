class PostsController < ApplicationController
 def index
   @posts = Post.all        #index'te birden fazla post göstereleceği için @posts dedik
 end

  def show
    @post=Post.find(params[:id])
  end

  def new                  #bos bir kayıt olusturma sayfası aciyoruz
                           #
       @post=Post.new
  end
 def create
   @post = Post.new(params[:post].permit(:title, :text))

   if @post.save          #Postu save etti
     redirect_to @post
   else
     render 'new'         #edemezse new.html sayfasına atar
   end
 end

 def edit
   @post = Post.find(params[:id])
 end

 def update
   @post = Post.find(params[:id])

   if @post.update(params[:post].permit(:title, :text))
     redirect_to @post    #tek bir objeyse show'a gönderir çoksa index sayfasına gönderir
   else
     render 'edit'
   end
   def destroy
     @post = Post.find(params[:id])
     @post.destroy

     redirect_to posts_path
   end
 end
 private

  def post_params
    params.require(:post).permit(:title, :text)

  end
end
