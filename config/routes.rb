Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post 'user/login'
    post 'user/add_user'
    
    root 'user#login'
    
    resources :events
    resources :user
end
