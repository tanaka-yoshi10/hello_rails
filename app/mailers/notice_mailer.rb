class NoticeMailer < ApplicationMailer

  def sendmail_confirm(comment)
    @comment = comment
    mail to:      "admin@example.com",
         subject: "新しいコメントが投稿されました"
  end
end
