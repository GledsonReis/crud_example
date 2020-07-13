class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(title: params[:post][:title], text: params[:post][:text])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :text)
    end
end
