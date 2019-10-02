json.content render('list.html.haml', topics: @topics)
json.meta do
  json.next_page @topics.next_page
end

