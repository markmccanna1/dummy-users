
#==================GET IT SUN=====================
get '/' do
  # Look in app/views/index.erb
  if session[:user]
    redirect '/secret'
  else
    erb :index
  end
end

get '/secret' do
  if !session[:user]
    redirect '/'
  else 
    erb :secret
  end
end

get '/user/new' do

  erb :signup
end


#==================POST IT SUN=====================

post '/validator' do
  @user = User.find_by_user_name(params[:name])
  redirect "/" if @user.nil?

  if @user.check_pw(params[:password])
    puts "GREAT SUCCESS"
    session[:user] = @user.id
    redirect "/secret"
  else
    puts "GREAT FAILURE"
    redirect "/"
  end

end

post '/user' do
  @user = User.new(user_name: params[:name], user_password: params[:password])
  @user.save

  redirect "/"
end

post '/logout' do
  session.clear
  redirect to '/'
end
