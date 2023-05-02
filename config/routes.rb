Rails.application.routes.draw do
  # get '/dogs', to: "pets#get_dogs"
  get 'pets/get_dogs', to: 'pets#get_dogs'

  resources :pets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
