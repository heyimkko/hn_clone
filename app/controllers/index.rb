get '/' do
    session[:user_id] = 1
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
  params[:user_id] = 55

  puts new_post = Post.new(params)
  if new_post.save
    redirect '/ '
  end
end

get '/posts/:id' do
  puts session[:user_id]
  @post = Post.find(params[:id])

  erb :'/posts/single_post'
end
