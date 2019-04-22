Rails.application.routes.draw do 
 
  devise_for :users
	resources :recipes do
		resources :comments
	end

	root "recipes#index"
	get "/about", to: "pages#about"
end
