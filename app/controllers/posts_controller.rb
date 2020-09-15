class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @posts = Post.all.page(params[:page]).per(10)
    @posts = Post.includes(:user).order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path(@user)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC')
    @like = Like.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

 

  private

  def post_params
    params.require(:post).permit(:image, :name, :genre_id , :store_name, :price, :address, :text, allergies: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

