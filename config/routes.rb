Rails.application.routes.draw do
  devise_for :users
  #ログイン、ユーザー情報更新後、ユーザー情報編集画面に飛ぶ
  # as :user do
  #   get 'users/edit', to: 'devise/registrations#edit', as: :user_root
  # end
  resources :users, only: [:show] do
    resources :producers, except: [:index]
    resources :relationships, only: %i[create destroy index]
    member do
      get :buy_history
    end
  end

  resources :items do
    resources :favorites, only: %i[create destroy index]
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

  resources :transactions, only: %i[create show index]

  root 'items#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
