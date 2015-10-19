# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url]
    )
  @song.save
  redirect '/songs'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :'songs/show'
end
