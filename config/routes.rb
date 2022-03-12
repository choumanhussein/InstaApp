Rails.application.routes.draw do
  root to: 'users#new'
  resources :blogs do
    post 'likes', to: 'loves#create'
    delete '/likes', to: 'loves#destroy'
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :likes
    end
  end
  resources :loves, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
