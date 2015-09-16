class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :approve]

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    @comment.status = "unapproved"

    @mail = NoticeMailer.sendmail_confirm(@comment).deliver

    if @comment.save
      redirect_to [@entry.blog, @entry], notice: 'Comment was successfully created.'
    else
      redirect_to [@entry.blog, @entry]
    end
  end

  def destroy
    @comment.destroy
    redirect_to [@entry.blog, @entry], notice: 'Comment was successfully destroyed.'
  end

  def approve
    @comment.status = "approved"

    if @comment.save
      redirect_to [@entry.blog, @entry], notice: 'Comment was successfully approved.'
    else
      redirect_to [@entry.blog, @entry]
    end

  end

  private
  def set_comment
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
