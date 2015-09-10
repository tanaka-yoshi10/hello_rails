class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
  end

  def edit
  end

  def new
    @blog = Blog.new
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
