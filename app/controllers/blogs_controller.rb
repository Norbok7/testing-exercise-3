class BlogsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /Blogs
  def index
    @Blogs = Blog.all
    render json: @Blogs
  end

  # GET /Blogs/1
  def show
    render json: @blog
  end

  # POST /Blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Blogs/1
  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Blogs/1
  def destroy
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end