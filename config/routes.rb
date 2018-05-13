Rails.application.routes.draw do
  devise_for :users
  root 'items#top'

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
