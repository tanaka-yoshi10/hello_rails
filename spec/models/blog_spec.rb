require 'rails_helper'

describe Blog do
  it "titleがあれば有効な状態であること" do
    blog = Blog.new(title: "title")
    expect(blog).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    blog = Blog.new(title: "")
    expect(blog).not_to be_valid
  end
end
