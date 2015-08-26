class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
    # song = Song.find(params[:id])
    # song.update(params[:song])
    # redirect "/songs/#{@song.id}"
  end

  patch '/songs/:id' do
    song = Song.find(params[:id])
    song.update(params[:song])
    redirect "/songs/#{@song.id}"
    #redirect "...." so we cansee that something has been updated.. maybe lets look into this
    #packaged in such a way that this will give the key value pair
  end

end
