Rails.application.routes.draw do
	get 'welcome/user'

	resources :users do
		collection do
			get :user_with_most_tickets
		end
	end
	resources :events do
		collection do
			get :upcoming_events
		end
	end
	resources :event_venues
	resources :tickets
	resources :ticket_types do
		resources :tickets
	end
	root 'welcome#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
