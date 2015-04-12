if @rating
  json.movie_id @comment.movie_id
  json.user_id @comment.user_id
  json.score @comment.unlike
  json.score @comment.like
  json.comment @comment.comments
else
  json.score 0
end