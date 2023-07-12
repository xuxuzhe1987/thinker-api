json.posts do
  json.array! @posts do |post|
    json.extract! post, :id, :nickname, :body, :avatarUrl, :open_id, :created_at, :rate
  end
end

json.my_posts do
  json.array! @my_posts do |post|
    json.extract! post, :id, :nickname, :body, :avatarUrl, :open_id
  end
end

json.my_likes @my_likes do |post_id|
  post = Post.find(post_id)
  json.extract! post, :id
end
