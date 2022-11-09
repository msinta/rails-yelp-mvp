Rails.application.routes.draw do
  get 'reviews/new'
  get 'restaurant/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, excludes: %i[delete update] do
    resources :reviews, only: %i[new create]
  end
end
