
#==================GET IT SUN=====================
get '/' do
  # Look in app/views/index.erb
  erb :index
end





get '/secret' do 
  erb :secret
end
















#==================POST IT SUN=====================

post '/validator' do
  @user = User.find_by_user_name(user[:name])

  if @user.check_pw(user[:password])
    puts "GREAT SUCCESS"
    redirect "/secret"
  else
    puts "GREAT FAILURE"
    redirect "/"
  end

end
