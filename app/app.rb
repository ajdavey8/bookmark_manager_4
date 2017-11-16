ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'

class App < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(name: params[:tag])
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:newlink)
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  run! if app_file == $0
end
