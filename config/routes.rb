Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      resources :leagues do
        resources :matches
      end
      resources :table_entries
      post 'login' => 'sessions#create'
      delete 'logout/:id' => 'sessions#destroy', as: 'logout'
    end
  end
end
