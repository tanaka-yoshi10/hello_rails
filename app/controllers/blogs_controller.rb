class BlogsController < ApplicationController
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
end
