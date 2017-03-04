Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post 'user/login'
    get 'user/new'
    post 'user/logout'
    get 'user/admin_login'
    post 'user/admin_password_validation'
    
    post 'events/new'
    
    get 'dashboard/index'
    
    root 'user#login'
    
    resources :events
    resources :user
end
