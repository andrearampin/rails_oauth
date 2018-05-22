# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'oauth#index'
  get '/oauth', to: 'oauth#show'
  get '/oauth/callback', to: 'oauth#callback'
  get '/request', to: 'request#show'
  get '/statements', to: 'request#statements'
  get '/statement1', to: 'request#statement1'
  get '/statement2', to: 'request#statement2'
  get '/lodgenow', to: 'request#lodgenow'
  post '/webhook', to: 'webhook#create'
end
