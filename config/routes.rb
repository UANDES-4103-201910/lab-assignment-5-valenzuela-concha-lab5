Rails.application.routes.draw do
  get 'event/Venues'
	get 'welcome/user'

	resources :users
	resources :events
	resources :event_venues
	resources :tickets
	root 'welcome#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
