Rails.application.routes.draw do 
 
  mount Notifications::Engine => "/notifications"
  devise_for :users
	resources :recipes do
		resources :comments
		put :like, on: :member
		put :dislike, on: :member
	end

	root "recipes#index"
	get "/about", to: "pages#about"
end
