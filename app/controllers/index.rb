get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/posts/new' do
  @post = Post.create

  erb :'/posts/new'
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])

  erb :'/posts/edit'
end

post '/new' do
  puts params
  params[:author_id] = 55
  puts new_post = Post.new(params)
  if new_post.save
    redirect '/ '
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])

  erb :'/posts/single_post'
end
