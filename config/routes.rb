Rails.application.routes.draw do
  root 'items#index'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
