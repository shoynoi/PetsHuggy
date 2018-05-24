Rails.application.routes.draw do

  resources :listings
  root "pages#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  resources :users, only: [:show]
  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end
  get "manege_listing/:id/basics" => "listings#basics", as: 'manage_listing_basics'
  get "manege_listing/:id/description" => "listings#description", as: 'manage_listing_description'
  get "manege_listing/:id/address" => "listings#address", as: 'manage_listing_address'
  get "manege_listing/:id/price" => "listings#price", as: 'manage_listing_price'
  get "manege_listing/:id/photos" => "listings#photos", as: 'manage_listing_photos'
  get "manege_listing/:id/calendar" => "listings#calendar", as: 'manage_listing_calendar'
  get "manege_listing/:id/bankaccount" => "listings#bankaccount", as: 'manage_listing_bankaccount'
  get "manege_listing/:id/publish" => "listings#publish", as: 'manage_listing_publish'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
