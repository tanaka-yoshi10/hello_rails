class NoticeMailer < ApplicationMailer

  def sendmail_newcomment(comment)
    @comment = comment
    mail to:      "tanaka.yoshi10@gmail.com",
         subject: "新しいコメントが投稿されました"
  end
end
