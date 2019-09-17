require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    status 200
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    hash = params[:article]

    @article = Article.create(hash)
    

    redirect to("/articles/#{Article.last.id}")
  end

  get '/articles/:id' do
    @article = Article.all.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  get '/' do
    status 200
    @articles = Article.all
    erb :index
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect to '/articles'
  end
end

