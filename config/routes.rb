Rails.application.routes.draw do
  resources :items, only: [:index, :new, :create] do
    member do
      put :sell
      put :undo
    end
  end

  root 'items#index'
end
