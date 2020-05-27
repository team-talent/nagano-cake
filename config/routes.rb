Rails.application.routes.draw do

	root "homes#home"
    get "/homes/thanks", to: "homes#thanks"
    get "/homes/about", to: "homes#about"

    devise_for :customers

	resource :customers, only:[:show] do
		member do
			get :edit_update
			patch :customers_update
			get :hide
			patch :hide_update
		end
	end
	resources :products, only:[:index, :show] do
		get :genre_product_index, on: :member
	end
	resources :destinations, only:[:index, :edit, :create, :update, :destroy]
	resources :orders, only:[:index, :show, :new, :create] do
   	collection do
			post :confirm, to: "orders/confirm"
		end
	end
	resources :carts, only:[:index, :create, :update, :destroy] do
		delete :destroy_all, on: :member
	end

	devise_for :staffs

	namespace :staffs do
		root "homes#top"
		get 'searchs/search', to:'searches#search'
		get 'orders/today', to:'orders#index_today'

		resources :customers, only:[:index, :show, :edit, :update]do
			member do
				get :customer_orders
			end
		end
		resources :products, only:[:index, :show, :new, :edit, :create, :update]
		resources :genres, only:[:index, :edit, :create, :update]
		resources :orders, only:[:index, :show]do
			member do
				patch :update_for_orderstatus
				patch :update_for_orderstatus_individual
				get :show_individual
			end
		end
		resources :details, only:[]do
			member do
				patch :update_for_productionstatus
				patch :update_for_productionstatus_individual
			end
		end
	end

end
