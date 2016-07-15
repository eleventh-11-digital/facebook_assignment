get '/' do
  erb :"static/index"
end

get '/home' do
  erb :"static/home"
end

get '/user/:id' do
	@user = User.find(params[:id])
	@status = @user.statuses
	@uu = @user.full_name
	erb :"static/user_page"
end

get '/usermain/:id' do
	@user = User.find(params[:id])
	@status = @user.statuses
	@uu = @user.full_name
	erb:"static/profile"
end

post '/status' do 
	@status = Status.new(status: params[:status], user_id: current_user.id)
	@status.save
	redirect '/home'
end

post '/likes/:id' do
	@statuslike = Like.find_by(status_id:params[:id], user_id: current_user.id)
		if @statuslike
			if @statuslike.likes == 1
				@statuslike.likes = 0
			elsif @statuslike.likes == 0
				@statuslike.likes = 1
			end
		else
			@statuslike = Like.new(status_id: params[:id], user_id: current_user.id, likes: 1)
		end
		@statuslike.save
		redirect '/home'
end

post '/likes/:id/user' do
	@statuslike = Like.find_by(status_id:params[:id], user_id: current_user.id)
		if @statuslike
			if @statuslike.likes == 1
				@statuslike.likes = 0
			elsif @statuslike.likes == 0
				@statuslike.likes = 1
			end
		else
			@statuslike = Like.new(status_id: params[:id], user_id: current_user.id, likes: 1)
		end
		@statuslike.save
		erb :"static/user_page"
end

post '/likes/:id/main' do
	@statuslike = Like.find_by(status_id:params[:id], user_id: current_user.id)
		if @statuslike
			if @statuslike.likes == 1
				@statuslike.likes = 0
			elsif @statuslike.likes == 0
				@statuslike.likes = 1
			end
		else
			@statuslike = Like.new(status_id: params[:id], user_id: current_user.id, likes: 1)
		end
		@statuslike.save
		erb :"static/profile"
end

post '/delete/:id' do
  @status = Status.delete(params[:id])
  erb :"static/profile"
end

post '/update/:id' do
  @status = Status.find(params[:id])
  @status.update(status: params[:status], user_id: current_user.id)
  redirect '/home'
end