get '/users/new' do

  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])

  erb :'/users/profile'
end

post '/users/new' do
  User.create(params)

  redirect '/'
end

post '/users/signin' do
  # User.find AUTH STUFF

  redirect '/'
end

post '/comment/new' do
  
  Comment.create(params)
  redirect back
end

get '/users/:id/comments' do
  @comments = Comments.where(:user_id => params[:id])

  erb :'/users/comments'
end  
