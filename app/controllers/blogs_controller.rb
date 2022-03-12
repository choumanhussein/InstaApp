class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  def index
    @blogs = Blog.all.order(id: "desc")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        ConfirmMailer.confirm_mail(@blog, current_user).deliver
        redirect_to blogs_path
      else
        render 'new'
      end
    end
  end

  def edit
    if Blog.find(params[:id]).user.name == current_user.name
      @blog = Blog.find(params[:id])
    else
      redirect_to blogs_path
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def show
    @loves = current_user.loves.find_by(blog_id: @blog.id)
  end
  
  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
