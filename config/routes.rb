Rails.application.routes.draw do

	root "homes#home"
    get "/homes/thanks", to: "homes#thanks"
    get "/homes/about", to: "homes#about"

	resource :customers, only:[:show, :edit, :update] do
		member do
			get :hide
			patch :hide_update
		end
	end
	resources :products, only:[:index, :show] do
			get :genre_product_index, on: :member
		end
	resources :destinations, only:[:index, :edit, :create, :update, :destroy]
	resources :orders, only:[:index, :show, :new, :create]
	resources :carts, only:[:show, :create, :update, :destroy]

	devise_for :staffs
	devise_for :customers

	namespace :staffs do
		root "homes#top"
		resources :customers, only:[:index, :show, :edit, :update]
		resources :products, only:[:index, :show, :new, :edit, :create, :update]
		resources :genres, only:[:index, :edit, :create, :update]
		resources :orders, only:[:index, :show]
	end

end
