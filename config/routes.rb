Rails.application.routes.draw do
  root to: "pages#home"
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[new create destroy]
  end
end
