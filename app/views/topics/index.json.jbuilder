json.content render(partial: 'list.html.haml', collection: @topics, as: :topic, cached: !user_signed_in?)
json.meta do
  json.next_page @topics.next_page
end

