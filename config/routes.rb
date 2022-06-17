Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "admin/admins#index"
  get 'admin/products/get_product_page'
  namespace :admin do
    resources :admins
    resources :products
    resources :categories
  end
end
