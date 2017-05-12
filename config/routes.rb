Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  devise_for :views
  devise_for :models
post '/ratings' => "ratings#create"
 resources :spots
 
 resources :users do

  	resources :reviews, except: [:show, :index]
  end

  resources :places
root 'welcome#index'
get "/location" => "user#location"

 get "/search" => "spots#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
