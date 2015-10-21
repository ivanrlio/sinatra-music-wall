helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

end

get '/' do
  erb :index
end

get '/songs' do
  if logged_in?
    @songs = Song.all
    erb :'songs/index'
  else
    redirect '/login'
  end
end

get '/songs/new' do
  if logged_in?
    @song = Song.new
    erb :'songs/new'
  else 
    redirect '/login'
  end
end

post '/songs' do
  if logged_in?
    @song = Song.new(
      title: params[:title],
      artist: params[:artist],
      url: params[:url],
      user_id: cookies[:user_id]     
      )
    @song.save
    redirect '/songs'
  else
    redirect '/login'
  end
end

get '/songs/:id' do
  if logged_in?
    @song = Song.find(params[:id])
    erb :'songs/show'
  else 
    redirect '/login'
  end
end

get '/signup' do
  erb :'signup'
end

post '/signup' do
  @error_messages = ['This username or password already exists!']

  username = params[:username]
  first_name = params[:first_name]
  last_name = params[:last_name]
  email = params[:email]
  gender = params[:gender]
  location = params[:location]
  dob = params[:dob]
  password = params[:password]
  personality = params[:personality]
  referred_how = params[:referred_how]

  existing_user1 = User.find_by(username: username)
  existing_user2 = User.find_by(email: email)

  if existing_user1 || existing_user2
    @error_messages = ['This username or email is already taken']
    redirect '/signup'
  else
    @user = User.create(
      username: username,
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      gender: gender,
      location: location,
      dob: dob,
      personality: personality,
      referred_how: referred_how
      )
    cookies[:user_id] = @user.id
    session[:user_id] = @user.id
    redirect '/songs'
  end
end

get '/login' do
  if !logged_in?
    erb :'login'
  else
    redirect '/profile'
  end
end

post '/login' do
  @user = User.find_by(username: params[:username], password: params[:password])
  if @user
    session[:user_id] = @user.id
    cookies[:user_id] = @user.id
    redirect '/profile'
  else
    @error_messages = ['Invalid username or password']
    erb :'login'
  end
end

get '/profile' do
  erb :'profile'
end
  
get '/logout' do
  session[:user_id] = nil
  cookies[:user_id] = nil
  redirect '/login'
end

get '/songs/upvote/:id' do
  if logged_in?
    @user_id = current_user.id
    @song_id = params[:id]

    if !Upvote.find_by(users_id: @user_id, songs_id: params[:id])
      upvote = Upvote.create(
        users_id: @user_id,
        songs_id: @song_id
        )

      song = Song.find(params[:id])
      pre_votes = song.votes.to_i
      post_votes = pre_votes + 1
      song.update(votes: post_votes)
      song.save

      redirect '/songs'
    else
      redirect '/songs'
    end
  end
end


