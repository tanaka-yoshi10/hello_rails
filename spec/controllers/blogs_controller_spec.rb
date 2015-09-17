require 'rails_helper'

describe BlogsController do
  describe 'GET #index' do
    it "@blogsに全てのBlogが入っていること" do
      blog = Blog.create(title: "test")
      get :index
      expect(assigns(:blogs)).to eq [blog]
    end
  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
      post :create, blog: { title: 'name' }
      blog = assigns(:blog)
      response.should redirect_to blog_path(blog)
    end
  end
end
