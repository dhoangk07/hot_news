Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  resources :events do 
  	get :increase_view_count, on: :member 
  end
	

	root to: 'events#index'
end
