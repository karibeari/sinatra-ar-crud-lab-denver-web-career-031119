
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  use Rack::MethodOverride

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.update({
    title: params[:title],
    content: params[:content]})
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect "/articles/#{@article.id}"
  end

end
