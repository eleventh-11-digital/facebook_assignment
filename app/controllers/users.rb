get '/signup' do
	erb :'users/new'
end

get '/login/user' do
	erb :"static/index" 
end 

post '/signup' do
	@user = User.new(params[:user])
		if @user.save
			@msg = "Hey!! You r Welcome to Facebook!"
			@user = User.all
			erb :"static/index"
		else
			@msg = "Please sign up for free candy!"
			@user = User.all
			erb :"static/index"
		end
end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user
		if @user.authenticate(params[:user][:password])
			log_in(@user)
			redirect '/home'
		else
			@msg = "Wrong password! Please try again!"
		end
	end
end

get '/logout' do
	log_out
	redirect '/'
end