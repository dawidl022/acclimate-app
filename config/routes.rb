Rails.application.routes.draw do
  root 'company_searches#new'
  get '/climate_ratings', to: 'company_searches#show'
end
