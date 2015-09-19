require 'rails_helper'

feature 'Blog管理' do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit new_blog_path
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit new_blog_path
    expect {
      fill_in 'Title', with: 'blog title'
      click_button 'Save'
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq blog_path(Blog.last)
    expect(page).to have_content "successfully created"
    expect(page).to have_content "Listing Entries"
  end
end
