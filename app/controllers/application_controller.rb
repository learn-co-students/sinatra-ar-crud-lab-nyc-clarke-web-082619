
require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post "/articles" do
    @article = Article.create(params[:article])
    #binding.pry
    redirect to "/articles/#{@article.id}"
  end

 
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  post "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end


  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end
 
end
