class AddCommentLikeAndUnlikeCount < ActiveRecord::Migration
  def change
    add_column :comments, :like_count, :integer
    add_column :comments, :unlike_count, :integer
  end
end
