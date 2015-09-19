require 'rails_helper'

feature 'Blog管理' do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること'
  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること'
end
