require "sinatra/base"

module Databasedotlocal
  class App < Sinatra::Base
    get '/services/oauth/token' do
    end

    get '/services/data/:version/sobjects' do
    end

    get '/services/data/:version/sobjects/:sobject/describe' do
    end

    get '/services/data/:version/sobjects/:sobject/:id' do
    end

    get '/services/data/:version/query' do
    end

    get '/services/data/:version/search' do
    end

    post '/services/data/:version/sobjects/:sobject' do
    end

    patch '/services/data/:version/sobjects/:sobject/:id' do
    end

    delete '/services/data/:version/sobjects/:sobject/:id' do
    end
  end
end
