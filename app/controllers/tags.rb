
get '/tag/:id' do
  @tag = Tag.find(params[:id])
  puts @tag.posts
  @posts = @tag.posts
  erb :posts_per_tag
end
