Rails.application.routes.draw do
  root to: 'items#top'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:show] do
    resources :favorites, only: [:index]
    resources :producers, except: %i[index destory]
    resources :relationships, only: %i[create destroy index]
    member do
      get :buy_history
      get :selling_items
      get :sold_items
    end
  end

  resources :items do
    resources :favorites, only: %i[create destroy]
    resources :comments
    collection do
      post :confirm
    end
    member do
      patch :confirm
      patch :buy_complete
      get :buy_confirm
    end
  end

  resources :transactions, only: %i[create show index destroy] do
    resources :messages, only: %i[index create new]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
