require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: {format: :json} do
    namespace :v0 do
      resources :articles, only: [:index, :show]
    end
  end
end
