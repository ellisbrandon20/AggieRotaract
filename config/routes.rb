Rails.application.routes.draw do
    resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'events/new'
  post 'img_upload/create'
end
