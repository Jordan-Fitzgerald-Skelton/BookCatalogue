Rails.application.routes.draw do
  resources :books do
    collection do
      get 'search', to: 'books#search'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end