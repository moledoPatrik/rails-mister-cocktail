Rails.application.routes.draw do
  root to: "pages#home"

  resources :cocktails, only: %i[index show new create]
end
