Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  resources :events do 
  	get :increase_view_count, on: :member 
  end
  get 'tags/:tag', to: 'events#index', as: :tag
	devise_for :users
		resources :users

	root to: 'events#index'
end
