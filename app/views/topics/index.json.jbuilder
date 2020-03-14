json.content render(partial: 'topics/list.html.haml', locals: {topics: @topics})
json.meta do
  json.next_page @topics.next_page
end
