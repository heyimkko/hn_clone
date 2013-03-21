before do
  puts request.path_info #!= '/users/signin'
  if session[:user].nil? && request.path_info != '/users/signin' 
    redirect "/users/signin" 
  elsif session[:user] && (request.path_info == '/users/new' || request.path_info == '/users/signin')
    redirect '/'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  new_user = User.new(params)
  if new_user.save
    session[:user] = new_user.id
    redirect '/'
  else
    erb :'/users/new'
  end
end

get '/users/signin' do
  erb :'/users/signin'
end

post '/users/signin' do

  found_user = User.where(email: params[:email],
                          password_hash: params[:password]).first

  unless found_user.nil?
    session[:user] = found_user.id
    puts "#{session[:user]}<<<< THIS IS MY SESSION ID"
    redirect '/'
  else
    erb :'/users/signin'
  end
  
end

get '/users/signout' do
  if session[:user]
    session.destroy
    puts "destroyed"
  end
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/profile'
end

post '/comment/new' do
  
  Comment.create(params)
  redirect back
end

get '/users/:id/comments' do
  @comments = Comments.where(:user_id => params[:id])

  erb :'/users/comments'
end  
