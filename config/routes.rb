Rails.application.routes.draw do
  get 'dashboard/index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'events/index'
    get 'dashboard/index'
    
    root 'dashboard#index'
    
    resources :events
end
