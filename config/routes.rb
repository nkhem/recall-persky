Rails.application.routes.draw do
  root "static_pages#root"
  namespace :api, defaults: {format: :json} do
    resource :user, only: [:create, :show, :update]
    resource :session, only: [:create, :show, :destroy]
    resource :event, only: [:create, :show, :update, :destroy]
  end
end
