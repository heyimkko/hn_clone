get '/users/new' do

  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])

  erb :'/users/profile'
end

post '/users/new' do
  User.create(params)

end

post '/users/signin' do
  # User.find AUTH STUFF
end
