Rails.application.routes.draw do
	devise_for :users

	resources :movies, only: [:index, :create, :show, :new, :edit, :update, :destroy] do
		resources :comments, only: [:index, :new, :edit]
	end
	
	resources :users, only: [:index, :show, :edit, :update] do
		resources :comments, only: [:index]
	end
	resources :comments, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "movies#index"
end
