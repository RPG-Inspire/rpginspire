json.comment @comment
json.meta do
  json.content render('comments/show.html.haml', comment: @comment)
end

