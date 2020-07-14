Rails.application.routes.draw do
  
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #get "/home" => "static#home"

end

