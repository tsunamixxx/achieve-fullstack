class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    # @blog = Blog.new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    # Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # Blog.create(params[:blog])
    # Blog.create(blog_params)
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
    
    # redirect_to new_blog_path
  end
  
  def show
    # @blog = Blog.find(params[:id])重複
  end
  
  def edit
    # @blog = Blog.find(params[:id])重複
  end
  
  def update
    # @blog = Blog.find(params[:id])重複
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    # @blog = Blog.find(params[:id])重複
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
