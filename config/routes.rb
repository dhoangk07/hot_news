Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
  resources :events
  get 'news', to: 'events#news'

	root to: 'events#news'

end
