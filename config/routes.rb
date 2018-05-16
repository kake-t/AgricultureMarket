Rails.application.routes.draw do
  devise_for :users
  #ログイン、ユーザー情報更新後、ユーザー情報編集画面に飛ぶ
  # as :user do
  #   get 'users/edit', to: 'devise/registrations#edit', as: :user_root
  # end
  resources :users, only: [:show] do
    resources :producers, except: [:index]
  end

  root 'items#index'

  resources :items do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
