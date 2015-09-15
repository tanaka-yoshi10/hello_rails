class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    @comment.status = "unapproved"

    if @comment.save
      redirect_to [@entry.blog, @entry], notice: 'Comment was successfully created.'
    else
      redirect_to [@entry.blog, @entry]
    end
  end

  private
  def set_comment
    @entry = Entry.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
