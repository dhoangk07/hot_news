Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  resources :events do 
  	get :increase_view_count, on: :member 

    get :hide, on: :member
    get :hidden, on: :collection
    get :display, on: :member

    get :bookmarked, on: :collection
    get :bookmark, on: :member
    get :unbookmark, on: :member

    get :history, on: :collection
    get :like, on: :member
    get :unlike, on: :member

  	resources :comments
  end
  resources :rsslinks
  resources :display
  
  get 'tags/:tag', to: 'events#index', as: :tag
	devise_for :users
		resources :users

	root to: 'events#index'
end
