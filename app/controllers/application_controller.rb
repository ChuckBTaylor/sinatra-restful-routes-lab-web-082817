class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    Recipe.delete(params[:id])
    redirect to "/recipes"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    Recipe.create(params)
    redirect to "/recipes/#{Recipe.last.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end
end
