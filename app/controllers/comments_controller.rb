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

  def destroy
    @comment.destroy
    @entry = Entry.find(params[:entry_id])
    redirect_to [@entry.blog, @entry], notice: 'Comment was successfully destroyed.'
  end

  def approve
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.find(params[:id])
    @comment.status = "approved"

    if @comment.save
      redirect_to [@entry.blog, @entry], notice: 'Comment was successfully approved.'
    else
      redirect_to [@entry.blog, @entry]
    end

  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
