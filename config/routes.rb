Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  devise_for :models

 resources :spots
root 'spots#new'


 get "/search" => "spots#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
