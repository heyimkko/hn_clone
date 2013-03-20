
get "/:id" do
  @post = Post.find(params[:id])
  @tags = @post.tags ||=[]
  erb :post
end

get "/edit/:id" do 
  @post = Post.find(params[:id])
  @tags = @post.tags
  erb :edit
end

post "/new" do
  @post = Post.create(:author => params[:author], :email => params[:email], :body => params[:body], :title => params[:title])
  tags  = params[:tags].split(', ')
  @tags = tags.map{|tag| Tag.create(:name =>tag)}
  @post.tags = @tags
  erb :post
end


put "/posts/:id" do 
  post = Post.find(params[:id])
  puts'helllllllllllllllllllllllll'
  puts 'params', params
  @post = update(post, params)
  redirect to '/'
end


delete "/posts/:id" do 
  post = Post.find(params[:id])
  post.destroy
  redirect to '/'
end


private

def update(post, params)
  post[:body] = params[:body] unless params[:body] ==''
  post[:title] = params[:title] unless params[:title] ==''
  post[:author] = params[:author] unless params[:author] ==''
  post[:email] = params[:email] unless params[:email] ==''
  post.save
  post
end
