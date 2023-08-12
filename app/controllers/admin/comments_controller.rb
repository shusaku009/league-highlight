class Admin::CommentsController < Admin::BaseController
  def index
    @q = Comment.ransack(params[:q])
    @pagy, @comments = pagy(@q.result(distinct: true), items: 20)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, error: "コメントを削除しました。"
  end
end
