Rails.application.routes.draw do
  resources :reviews
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:show]
  devise_scope :user do
    get '/users/auth/kakao', to: 'users/omniauth_callbacks#kakao'
    get '/users/auth/kakao/callback', to: 'users/omniauth_callbacks#kakao_auth'
  end
  
  get 'users/:id' => 'users#show'
  
  root 'restaurants#index'
  
  resources :reviews
  
  post '/uploads' => 'reviews#upload_image'
  #좋아요
  get 'likes/:review_id' => 'reviews#like_review'
  #스크랩
  post 'restaurants/:restaurant_id/scrab' => 'scrabs#scrab_toggle' ,as: 'new_scrab'
  #해시태그
  get '/restaurants/hashtags/:name' => 'restaurants#hashtags' ,as: 'hashtag'
  
  resources :restaurants do
    member do
    
    end
    
    collection do
    
      get '/search_restaurant' => 'restaurants#search_restaurant'
    end
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
