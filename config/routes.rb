Rails.application.routes.draw do
  root to: 'oauth#index'
  get '/oauth', to: 'oauth#show'
  get '/oauth/callback', to: 'oauth#callback'
  get '/request', to: 'request#show'
  get '/statements', to: 'request#statements'
  get '/statement', to: 'request#statement'
  get '/lodgenow', to: 'request#lodgenow'
  post '/webhook', to: 'webhook#create'
end
