Rails.application.routes.draw do
  root :to => 'sessions#new'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      post :confirm
      patch :confirm
      get :gallery
      get :gallery_list
    end
    member do
      patch :confirm
    end
  end
  resources :pictures do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end