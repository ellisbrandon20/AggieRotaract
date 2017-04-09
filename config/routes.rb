Rails.application.routes.draw do

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post 'user/login'
    get 'user/new'
    post 'user/logout'
    get 'user/admin_login'
    post 'user/admin_password_validation'
    get 'user/list'
    
    post 'events/new'
    get 'events/sign_up_for_event'
    post 'events/sign_up_for_event'
    post 'events/remove_from_event'
    post 'attendances/remove_from_event'
    
    get 'points/meeting'
    post 'points/meeting_signin'
    
    #   get 'events/new'
    
    get 'dashboard/index'
    post 'dashboard/index'
    
    post 'img_upload/create'
    
    root 'user#login'
    
    resources :events
    resources :user
    resources :points
    resources :attendances

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
